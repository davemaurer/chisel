require 'minitest/autorun'
require 'minitest/pride'
require_relative 'chisel'

class HeaderTest < MiniTest::Test

  attr_reader :header
  def setup
    @header = Header.new
  end

  def test_it_exists
    assert header
  end

  def test_it_can_take_a_string
    skip
    t = Chisel.new
    t.parse("This is a test")
    assert_equal "This is a test", t.document
  end
end
