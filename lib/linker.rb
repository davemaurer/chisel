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
  def link_replacer(string)
    parts = string.split(/\[|\]|\(|\)/).join(" ").split("  ")
    "<p><a href=#{parts[1]}>#{parts[0].strip}</a></p>\n"
  end
end
