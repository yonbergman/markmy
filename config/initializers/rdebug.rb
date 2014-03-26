DEBUG_ENV_EXCEPTIONS = %w(rake spork rspec sidekiq)

def debug_env_exception?
  $rails_rake_task || DEBUG_ENV_EXCEPTIONS.any? {|env| ($0 =~ /#{env}$/).present?}
end

if (Rails.env.development? || Rails.env.test?) && !debug_env_exception? && !defined?(Rails::Console)
  require 'ruby-debug'
  Debugger.settings[:autoeval] = true
  Debugger.settings[:autolist] = 1
  Debugger.settings[:reload_source_on_change] = true
  Debugger.start_remote
end
