require './lib/server'

class Parser

  attr_reader :request

  def initialize(request)
    @request = request
    diagnostic_lines
  end

  def diagnostic_lines
    verb_line = @request[0].split(" ")
    debug = Hash.new
    debug["Verb:"] = verb_line[0]
    debug["Path:"] = verb_line[1]
    debug["Protocol:"] = verb_line[2]
    host_port = @request[2].split(":")
    debug["Host:"] = host_port[1]
    debug["Port:"] = host_port[-1]
    debug["Origin:"] = host_port[1]
    debug["Accept:"] = @request[6]
    debug
  end

  def diagnostic
    # require 'pry'; binding.pry
    a = diagnostic_lines.map do |key,value|
      "#{key} #{value}"
    end.join("\n")
  end

end



#   def verb
#     "Verb: #{@request[0].split[0]}\n"
#   end
#
#   def path
#     "Path: #{@request[0].split[1]}\n"
#   end
#
#   def protocol
#     "Protocol: #{@request[0].split[2]}\n"
#   end
#
#   def host
#     host = @request[1].split(':')
#     "Host: #{host[1]}\n"
#   end
#
#   def port
#     port = @request[1].split(':')
#     "Port: #{port[-1]}\n"
#   end
#
#   # def origin
#   #   "Origin: #{@request[]}"
#   # end
#
#   def accept
#     "Accept: #{@request[6]}\n"
#   end
#
#   def diagnostic
#     verb + "\n" + path + "\n" + protocol + "\n" + host +"\n"+ port +"\n"+ accept
#   end
#
# end
