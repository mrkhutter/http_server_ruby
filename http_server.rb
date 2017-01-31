require 'socket'
require 'rack'
require 'rack/lobster'

app = Rack::Lobster.new
server = TCPServer.new 5678

while session = server.accept
  request = session.gets
  puts request

  status, headers, body = app.call({})

  session.print "HTTP/1.1 #{status}\r\n"

  headers.each do |k, v|
    session.print "#{k}: #{v}\r\n"
  end

  session.print "\r\n"

  body.each do |part|
    session.print part
  end

  session.close
end
