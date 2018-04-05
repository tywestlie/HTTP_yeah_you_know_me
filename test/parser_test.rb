require 'minitest/autorun'
require 'minitest/pride'
require './lib/parser.rb'

class ParserTest < Minitest::Test

  def setup
    request_lines = ["GET / HTTP/1.1",
      "Host: localhost:9292",
      "Connection: keep-alive",
      "Cache-Control: no-cache",
      "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36",
      "Postman-Token: 372bfb2d-7508-4711-581c-f756adf44af8",
      "Accept: */*",
      "Accept-Encoding: gzip, deflate, br",
      "Accept-Language: en-US,en;q=0.9"]
    @parser = Parser.new(request_lines)
  end

  def test_parser_gets_request
    actual = @parser.request
    expected = ["GET / HTTP/1.1", "Host: localhost:9292", "Connection: keep-alive", "Cache-Control: no-cache", "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36", "Postman-Token: 372bfb2d-7508-4711-581c-f756adf44af8", "Accept: */*", "Accept-Encoding: gzip, deflate, br", "Accept-Language: en-US,en;q=0.9"]

    assert_equal expected, actual
  end

  def test_has_diagnostic_lines
    actual = @parser.diagnostic_lines
    expected = {"Verb:"=>  "GET", "Path:"=>"/", "Protocol:"=>"HTTP/1.1", "Host:"=>" localhost", "Port:"=>"9292", "Origin:"=>" localhost", "Accept:"=>"Accept: */*"}

    assert_equal expected, actual
  end

  def test_diagnostic_outputs_string
    actual = @parser.diagnostic
    expected = "Verb: GET\nPath: /\nProtocol: HTTP/1.1\nHost:  localhost\nPort: 9292\nOrigin:  localhost\nAccept: Accept: */*\n"
    assert_equal expected, actual
  end
end
