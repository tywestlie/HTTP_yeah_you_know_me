require 'minitest/autorun'
require 'minitest/pride'
require './lib/server.rb'

class ServerTest < Minitest::Test

  def tests_server_accepts_requests
    server = Server.new
    assert_instance_of Server, server
  end
  
end
