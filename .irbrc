if RUBY_VERSION == "1.8.7"
  system("[[ ! -e .irb_history ]] && echo > .irb_history")
  load '/etc/irbrc'
end

begin
  require 'wirble'
  Wirble.init :skip_history => true
  Wirble.colorize
rescue LoadError => err
  $stderr.puts err
end

