require'./lib/server.rb'

class Parser

  def initialize
    @debug = {}
  end

  def diagnostic_lines(@request)
    verb_line = @request[0].split(" ")
    @debug["Verb:"] = first_line[0]
    @debug["Path:"] = first_line[1]
    @debug["Protocol:"] = first_line[2]
    host_port = @request[2].split(":")
    @debug["Host:"] = host_port[1]
    @debug["Port:"] = host_port[-1]
    @debug["Accept:"] = @request[6]
    @debug
  end

  def diagnostic
  end

  # def verb
  #   "Verb: #{@request[0].split[0]}\n"
  # end
  #
  # def path
  #   "Path: #{@request[0].split[1]}\n"
  # end
  #
  # def protocol
  #   "Protocol: #{@request[0].split[2]}\n"
  # end
  #
  # def host
  #   host = @request[1].split(':')
  #   "Host: #{host[1]}\n"
  # end
  #
  # def port
  #   port = @request[1].split(':')
  #   "Port: #{port[-1]}\n"
  # end

  # def origin
  #   "Origin: #{@request[]}"
  # end

#   def accept
#     "Accept: #{@request[6]}\n"
#   end
#
# end
