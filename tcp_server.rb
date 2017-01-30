require 'socket'
server = TCPServer.new 5678

while session = server.accept
  session.puts "hello world! the time is #{Time.now}"
  session.close
end
