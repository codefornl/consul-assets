# consul-assets

__Feed the microservice the name of an asset source through the `set` parameter to download assets and unzip them into the right directories__

For example:

```
curl -s http://localhost:8080/?set=emmen | bash
```

Will download everything in the `emmen` subdirectory and unzip it. This will probably only work on linux, and only has use with the consul docker image.