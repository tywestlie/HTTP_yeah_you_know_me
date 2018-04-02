require 'socket'
class Server

  def intialize
    @server = TCPServer.new(9292)
    @client = server.accept
  end

  def request_line
    request_lines = []
    while line = client.gets and !line.chomp.empty?
    request_lines << line.chomp
  end

end
