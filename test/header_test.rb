require 'minitest/autorun'
require 'minitest/pride'
require_relative 'header'

class HeaderTest < MiniTest::Test

  attr_reader :header
  def setup
    @header = Header.new
  end

  def test_it_exists
    assert header
  end

  def test_it_can_take_a_string
    tester = "<h1>This is a test</h1>\n"
    assert_equal tester, header.header_replacer("# This is a test")
  end

  def test_it_can_take_a_string_with_two_things
    tester = "<h2>This is another test</h2>\n"
    assert_equal tester, header.header_replacer("## This is another test")
  end

  def test_it_can_reproduce_an_entire_document
    document = '# My Life in Desserts

    ## Chapter 1: The Beginning

    "You just *have* to try the cheesecake," he said. "Ever since it appeared in
    **Food & Wine** this place has been packed every night."'
    tester = '<h1>My Life in Desserts</h1>
    <h2>Chapter 1: The Beginning</h2>
    "You just *have* to try the cheesecake," he said. "Ever since it appeared in
    **Food & Wine** this place has been packed every night."'
    assert_equal tester, header.header_replacer(document)
  end
end
