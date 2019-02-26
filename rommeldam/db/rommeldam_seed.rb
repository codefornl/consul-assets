require 'database_cleaner'
DatabaseCleaner.clean_with :truncation
@logger = Logger.new(STDOUT)
@logger.formatter = proc do |_severity, _datetime, _progname, msg|
                      msg unless @avoid_log
                    end

def section(section_title)
  @logger.info section_title
  yield
  log(' ✅')
end

def log(msg)
  @logger.info "#{msg}\n"
end

def random_locales
  [I18n.default_locale]
end

require_relative 'rommeldam_seed/settings'
require_relative 'rommeldam_seed/geozones'
require_relative 'rommeldam_seed/users'
require_relative 'rommeldam_seed/tags_categories'
require_relative 'rommeldam_seed/debates'
require_relative 'rommeldam_seed/proposals'
require_relative 'rommeldam_seed/budgets'
require_relative 'rommeldam_seed/spending_proposals'
require_relative 'rommeldam_seed/comments'
require_relative 'rommeldam_seed/votes'
require_relative 'rommeldam_seed/flags'
require_relative 'rommeldam_seed/hiddings'
require_relative 'rommeldam_seed/banners'
require_relative 'rommeldam_seed/polls'
require_relative 'rommeldam_seed/communities'
require_relative 'rommeldam_seed/legislation_processes'
require_relative 'rommeldam_seed/newsletters'
require_relative 'rommeldam_seed/notifications'
require_relative 'rommeldam_seed/widgets'
require_relative 'rommeldam_seed/admin_notifications'
require_relative 'rommeldam_seed/legislation_proposals'
require_relative 'rommeldam_seed/milestones'

log "Parbleu! Rommeldam aangemaakt 👍"
