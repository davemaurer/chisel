require 'minitest/autorun'
require 'minitest/pride'
require '../lib/linker'

class LinkerTest < Minitest::Test
  def test_it_will_convert_an_inline_link
    link = Linker.new("[This link](http : //ex ample.net/) has no title attribute.")
    expected = ("<p>[This link](http : //ex ample.net/) has no title attribute.</p>")
    assert_equal expected, link.convert_link
  end
end
