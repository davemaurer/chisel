 use abstractions in your tests, ie

```  def assert_parses_header(markdown, html)
    assert_equal html, header.header_replacer(html)
  end

  def test_it_can_take_a_string
    assert_parses_header "# This is a test",
                         "<h1>This is a test</h1>\n"
  end
  ```
* Split definitions (ie classes) from "side effects" which means
 anything that goes off and does shit. ie
* Also: `File.read` and `File.write`, avoid the `File.open` unless you need it
 ie: `File.write './workfiles/parsed.txt', output`
* Use a better name for document_splitter
* Whatever you're doing in pry, turn into a test
* "abc\ndef\nghi"[/c.d/m]  # => "c\nd"
