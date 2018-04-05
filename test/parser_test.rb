require 'minitest/autorun'
require 'minitest/pride'
require './lib/parser.rb'

class ParserTest < Minitest::Test
  attr_reader :parser, :request_lines
  
  def setup
    @parser = Parser.new
    @request_lines = ["GET / HTTP/1.1",
                      "Host: localhost:9292",
                      "Connection: keep-alive",
                      "Cache-Control: no-cache",
                      "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36",
                      "Postman-Token: 372bfb2d-7508-4711-581c-f756adf44af8",
                      "Accept: */*",
                      "Accept-Encoding: gzip, deflate, br",
                      "Accept-Language: en-US,en;q=0.9"]
  end

  def test_verb
    parser = @parser
    rl = @request_lines

    assert_equal 0, parser.rl
  end

end
