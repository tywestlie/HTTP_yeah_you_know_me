require 'socket'
class Server

  def initialize
    server = TCPServer.new(9292)
    request_line(server)
  end

  def request_line(server)
    counter = 0
    while counter <= 5 do
      client = server.accept
      request = request_lines(client)
      puts "Got this request:"
      puts request.inspect
      puts "Sending response."
      response = "<h1> Hello! #{counter}</h1>"
      message = assemble_message(response)
      client.puts message
      client.close
      counter +=1
    end
  end

  def assemble_message(response)
    output = "<html><head></head><body>#{response}</body></html>"
    headers = ["http/1.1 200 ok",
      "date: #{Time.now.strftime('%a, %e %b %Y %H:%M:%S %z')}",
      "server: ruby",
      "content-type: text/html; charset=iso-8859-1",
      "content-length: #{output.length}\r\n\r\n"].join("\r\n")
      headers + output
  end

  def request_lines(client)
    request_lines = []
    while line = client.gets and !line.chomp.empty?
      request_lines << line.chomp
    end
    request_lines
  end

end


s = Server.new
