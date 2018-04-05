require 'minitest/autorun'
require 'minitest/pride'
require './lib/server.rb'

class ServerTest < Minitest::Test

  def tests_server_exists
    server = Server.new
    assert_instance_of Server, server
  end

  def test_assemble_message
    server = Server.new
    assert_equal "Hello World 1", server
  end

end
