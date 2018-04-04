require 'minitest/autorun'
require 'minitest/pride'
require './lib/parser.rb'

class ParserTest < Minitest::Test

  def setup
    @test = Parser.new
  end

  def test_verb
    assert_equal 0, @test.verb
  end
  
end
