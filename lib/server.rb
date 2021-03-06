require 'socket'
require './lib/parser'

class Server
  attr_reader :request, :hello_counter

  def initialize
    server = TCPServer.new(9292)
    @hello_counter = 0
    server_loop(server)
    @request = []
  end

  def server_loop(server)
    counter = 1
    loop do
      client = server.accept
      @request = request_lines(client)
      verb_path = @request[0].split[0] + ' ' + @request[0].split[1]
      get_response = response_path(verb_path, counter)
      response = "<pre>#{get_response}</pre>"
      message = assemble_message(response)
      client.puts message
      client.close
      counter += 1
      break if verb_path == "GET /shutdown"
    end
  end

  def request_lines(client)
    request_lines = []
    while line = client.gets and !line.chomp.empty?
      request_lines << line.chomp
    end
    request_lines
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

  def hello_world
    @hello_counter += 1
    "Hello World!(#{@hello_counter})"
  end

  def dictionary
    File.readlines("/usr/share/dict/words")
  end

  def string_search(request)
    @request[0].split[1].partition("?")
  end

  def response_path(verb_path, counter)
    if verb_path == "GET /"
      parser = Parser.new(@request)
      "#{parser.diagnostic}"
    elsif verb_path == "GET /hello"
      "#{hello_world}"
    elsif verb_path == "GET /datetime"
      "#{Time.now.strftime('%r on %A, %B %e, %Y')}"
    elsif verb_path == "GET /shutdown"
      "Shuting down, total Requests:#{counter}"
    elsif verb_path == "GET /word_search"
      "Search imminent..."
    end
  end

end
