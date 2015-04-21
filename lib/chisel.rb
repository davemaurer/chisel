require_relative "header"
require_relative "paragrapher"
require_relative "emphasis"
require 'pry'

class Chisel

  def emphasize(document)
    # word.map do |word|
    emphasized = document.gsub!('&', '&amp;').gsub!('**', '<strong>').gsub!('*', '<em>').split(/ /).map do |word|
      if word.end_with?('<strong>')
        word.chomp('<strong>') + '</strong>'
      elsif word.end_with?('<em>')
        word.chomp('<em>') + '</em>'
      else
        word
      end
    end
    emphasized.join(" ")
  end


  def parse(document)
    parsed_document = []
    emphasize(document).split("\n\n").each do |string|
      # return_count = @document.each {|chunk| chunk.count("\n")}
      if string.start_with?("#")
        parsed_document << Header.new.header_replacer(string)
      else
        parsed_document << Paragrapher.new.paragraph_replacer(string)
      end
    end
    parsed_document.join
  end

end



# document = '# My Life in Desserts
#
# Chapter 1: The Beginning
#
# "You just *have* to try the cheesecake," he said. "Ever since it appeared in
# **Food & Wine** this place has been packed every night."'

parser = Chisel.new
output = parser.parse(File.read('./workfiles/chisel.txt'))
puts output

