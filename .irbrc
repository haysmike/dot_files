if ENV["rvm_env_string"].nil?
  system("[[ ! -e ~/.irb_history ]] && echo > ~/.irb_history")
  load '/etc/irbrc'
end

begin
  require 'rubygems'
  require 'wirble'
  Wirble.init :skip_history => true
  Wirble.colorize
rescue LoadError => err
  $stderr.puts err
end

