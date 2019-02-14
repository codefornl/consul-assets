(function () {
  'use strict';
  var http = require("http");
  var path = require('path');
  var fs = require('fs');
  var Archiver = require('archiver');

  /**
   * Parse the params of the request.
   */
  function params(req) {
    var q = req.url.split('?');
    var result = {};
    if (q.length >= 2) {
      q[1].split('&').forEach(function (item) {
        try {
          result[item.split('=')[0]] = item.split('=')[1];
        } catch (e) {
          result[item.split('=')[0]] = '';
        }
      });
    }
    return result;
  }

  /**
   * Helper to prevent directory traversal
   */
  function safePath(unsafeSuffix) {
    var _clean = path.normalize(unsafeSuffix).replace(/^(\.\.[\/\\])+/, '');
    if (_clean.length < 3) {
      return ""
    } else {
      return _clean
    }
  }

  /**
   * Helper to set headers
   */
  function setHeaders(type) {
    var _headers = {
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Methods": "GET",
      "Access-Control-Allow-Headers": "Origin, X-Requested-With, Content-Type, Accept"
    };
    if (type === "zip") {
      _headers["Content-Type"] = 'application/zip';
      _headers["Content-disposition"] = 'attachment; filename=' + Math.floor(new Date() / 1000) + '.zip';
    }
    _headers["Content-Type"] = "text/plain";
    return _headers;
  }

  function getProtocol(req) {
    var proto = req.connection.encrypted ? 'https' : 'http';
    // only do this if you trust the proxy
    proto = req.headers['x-forwarded-proto'] || proto;
    return proto.split(/\s*,\s*/)[0];
  }

  /**
   * The main object.
   */
  var server = http.createServer(function (request, response) {
    var _params = params(request);
    if (_params.set) {
      var _set = safePath(_params.set, response);
      if (fs.existsSync(_set)) {
        response.writeHead(200, setHeaders(""));
        response.write("#!/bin/bash\n" +
          "echo You requested the set: " + _set + " and version: " + (_params.version || "0") + ". let me see if I can get it for you\n" +
          "curl -s -k '" + getProtocol(request) + "://" + request.headers.host + "/?get=" + _set + "&format=zip' -o '" + _set + ".zip'\n" +
          "unzip " + _set + ".zip\nls\n");
        response.end();
      } else {
        response.writeHead(404, setHeaders(""));
        response.write("No clue. Are you here by accident? - 404");
        response.end();
      }
    } else if (_params.get) {
      // check if the directory exists
      var _get = safePath(_params.get);
      if (fs.existsSync(_get)) {
        // pack the assets and send them as zip
        var archive = Archiver('zip');
        response.writeHead(200, setHeaders("zip"));
        // Send the file to the page output.
        archive.pipe(response);
        archive.directory(_get, false);
        archive.finalize();
      } else {
        response.writeHead(404, setHeaders(""));
        response.write("Could not find that. Are you here by accident? - 404");
        response.end();
      }

    } else {
      response.writeHead(404, setHeaders(""));
      response.write("You had one job. Put the name of a consul environment in parameter ?set= and try again - 404");
      response.end();
    }
  });

  module.exports = server;
}());