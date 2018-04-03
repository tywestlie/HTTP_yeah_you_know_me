require'./lib/server.rb'

class Parser

  def verb
    "Verb: #{@request[0].split[0]}\n"
  end

  def path
    "Path: #{@request[0].split[1]}\n"
  end

  def protocol
    "Protocol: #{@request[0].split[2]}\n"
  end

  def host
    "Host: #{@request[1].split[2]}\n"
  end

  def port
    "Port: #{@request[1].split[2]}\n"
  end

  # def origin
  #   "Origin: #{@request[]}"
  # end

  def accept
    "Accept: #{@request[6].split[2]}\n"
  end

end
