class Chisel
  def initialize
    @new_document = []
    @string = []
  end

  def parse(document)
    @document = document.split(/\n\n/)
    @document.each do |x|
      x = x.delete("\t")
      if x[0] == "#"
        @new_document << pound_to_header(x)
      elsif x[0] == "*"
        @new_document << unordered_lister(x)
      elsif x[0][/\d/]
        @new_document << ordered_lister(x)
      else
        @new_document << paragrapher(x)
      end
    end
    @new_document.join
  end

  def pound_to_header(string)
    pound_count = string.count("#")
    "<h#{pound_count}>"+string[pound_count+1..string.length]+"</h#{pound_count}>\n\n"
  end

  def paragrapher(string)
    new_string = "<p>\n" + emphasizer(string) + "\n</p>\n"
  end

  def emphasizer(string)
    new_string = string
    emphasized = nil
    while new_string[/\*.+\*/] != nil
      asterisk_phrase = new_string[/\*.+\*/]
      case asterisk_phrase.count("*")
      when 2
        emphasized = "<em>" + asterisk_phrase[1..asterisk_phrase.length-2] + "</em>"
        new_string = new_string.gsub(asterisk_phrase, emphasized)
      when 4
        emphasized = "<strong>" + asterisk_phrase[2..asterisk_phrase.length-3] + "</strong>"
        new_string = new_string.gsub(asterisk_phrase, emphasized)
      end
    end
    new_string = new_string.gsub("&", "&amp;")
  end

  def unordered_lister(string)
    list_array = string.split("\n")
    new_array = []
    list_array.each {|x| new_array << x.gsub("* ","<li>") + "</li>\n"}
    "\n<ul>\n" + new_array.join + "</ul>\n"
  end

  def ordered_lister(string)
    list_array = string.split("\n")
    new_array = []
    list_array.each do |x|
      new_array << x.gsub(/\d.\s/,"<li>") + "</li>\n"
    end
    "\n<ol>\n" + new_array.join + "</ol>\n"
  end
end

if __FILE__ == $0
  document = '# My Life in Desserts
  ## Chapter 1: The Beginning
  "You just *have* to try the cheesecake," he said. "Ever since it appeared in
  **Food & Wine** this place has been packed every night."'

  ordered_list = "My favorite cuisines are:
  1. Sushi
  2. Barbeque
  3. Mexican"

  unordered_list = "My favorite cuisines are:
  * Sushi
  * Barbeque
  * Mexican"
end
  parser = Chisel.new
  output = parser.parse(ordered_list)
  puts output

%w(foo bar).each_with_object({}) {|str,hsh| hsh[str] = str.upcase}
