require 'minitest/autorun'
require 'minitest/pride'
require 'faraday'
require './lib/server.rb'

class ServerTest < Minitest::Test
  def setup
    @server = Server.new
  end

  def tests_server_exists
    assert_instance_of Server, @server
  end

  def test_hello_counter_starts_at_zero
    assert_equal 0, @server.hello_counter
  end

end
