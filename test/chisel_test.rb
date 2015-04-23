require 'minitest/autorun'
require 'minitest/pride'
require '../lib/chisel'

class ChiselTest < MiniTest::Test
  attr_reader :chisel

  def setup
    @chisel = Chisel.new('../workfiles/chisel.txt', '../workfiles/tester.txt')
  end

  def test_it_can_take_in_a_file_to_read
    assert_equal '../workfiles/chisel.txt', chisel.markdown_file
  end

  def test_it_can_take_in_a_file_to_write
    assert_equal '../workfiles/tester.txt', chisel.html_file
  end

  def test_it_will_default_to_nil_if_no_html_file_is_given
    chisel = Chisel.new('../workfiles/chisel.txt')
    assert_equal nil, chisel.html_file
  end

  def test_it_can_call_the_emphasis_class_methods
    emph = Emphasizer.new('../workfiles/tester.txt')
    assert emph
  end

  def test_it_will_split_the_text_into_chunks_on_two_returns
    chisel = Chisel.new("this is\n a test\n\n string")
    assert_equal ["this is\n a test", " string"], chisel.split_text
  end

  def test_it_parses_paragraphs
    chisel = Chisel.new("This is a paragraph")
    assert_equal "<p>\nThis is a paragraph\n</p>\n", chisel.parse
  end

  def test_it_parses_an_entire_document
    correct_parse = File.read '../workfiles/parsed_file_example.txt'
    chisel.parse
    result = File.read "../workfiles/parsed.txt"
    assert_equal correct_parse, result
  end
end
