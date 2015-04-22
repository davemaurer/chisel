require 'minitest/autorun'
require 'minitest/pride'
require '../lib/chisel'
require '../lib/emphasis'

class ChiselTest < MiniTest::Test

  attr_reader :chisel
  def setup
    @chisel = Chisel.new('../workfiles/chisel.txt', '../workfiles/tester.txt')
  end

  def test_it_can_take_in_a_file_to_read
    assert_equal '../workfiles/chisel.txt', @chisel.markdown_file
  end

  def test_it_can_take_in_a_file_to_write
    assert_equal '../workfiles/tester.txt', @chisel.html_file
  end

  def test_it_will_default_to_nil_if_no_html_file_is_given
    @chisel = Chisel.new('../workfiles/chisel.txt')
    assert_equal nil, @chisel.html_file
  end

  def test_it_can_call_the_emphasis_class_methods
    emph = Emphasis.new('../workfiles/tester.txt')
    assert emph
  end

  def test_it_will_split_the_text_into_chunks_on_two_returns
    @chisel = Chisel.new("this is\n a test\n\n string")
    assert_equal ["this is\n a test", " string"], @chisel.split_text
  end

  def test_it_parses_headers
    @chisel = Chisel.new("# This is\n\n#### a test.\n\n## To see")
    assert_equal "<h1> This is </h1>\n\n<h4> a test. </h4>\n\n<h2> To see </h2>\n\n", @chisel.parse
  end

end
