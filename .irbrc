begin
  load '/etc/irbrc'
  require 'wirble'

  Wirble.init
  Wirble.colorize
rescue LoadError => err
  $stderr.puts "Couldn't load Wirble: #{err}"
end
