# This is [an example](http : //example.com/ "Title") inline link.
#
# Will produce:
#
# <p>This is <a href="http://example.com/" title="Title">an example</a> inline link.</p>
#
#
#
# [This link](http://example.net/)
#
# Will produce:
#
# <p><a href="http://example.net/">This link</a></p>
#
# example regex to convert the html to markdown
# gsub /<a [^h]*href=["']([^"']*)["'][^>]*>([^<]*)<\/a>/, "[\\2](\\1)

class Linker
  attr_reader :string

  def initialize(string)
    @string = string
  end

  def convert_link

  end
end
