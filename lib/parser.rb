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
    host_port = @request[1].split(":")

    debug["Host:"] = host_port[1]
    debug["Port:"] = host_port[-1]
    debug["Origin:"] = host_port[1]
    debug["Accept:"] = @request[6]
    debug
  end

  def diagnostic
    diagnostic_string = ""
    diagnostic_lines.each do |name,value|
      diagnostic_string  << "#{name} #{value}" + "\n"
    end
    diagnostic_string
  end

end
