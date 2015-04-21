require_relative "header"
require_relative "paragrapher"
require_relative "emphasis"
require 'pry'

class Chisel

  def initialize(document)
    @document = document
    @parsed_document = []
  end

  def emphasizer
    @document = @document.gsub!('&', '&amp;').split(/ /)
    binding.pry
    @document.map do |word|
      word[0..1] = '<strong>' if word.delete("\n")[0..1] == '**'
      word[-2..-1] = '</strong>' if word.delete("\n")[-2..-1] == '**'
      word[0] = '<em>' if word.delete("\n")[0] == '*'
      word[-1] = '</em>' if word.delete("\n")[-1] == '*'
    end
    @document.join(" ")
  end

  def document_splitter
    emphasizer.split("\n\n").each do |string|
      # return_count = @document.each {|chunk| chunk.count("\n")}
      if string.start_with?("#")
        @parsed_document << Header.new.header_replacer(string)
      else
        @parsed_document << Paragrapher.new.paragraph_replacer(string)
      end
    end
    @parsed_document.join
  end

end

# document = '# My Life in Desserts
#
# Chapter 1: The Beginning
#
# "You just *have* to try the cheesecake," he said. "Ever since it appeared in
# **Food & Wine** this place has been packed every night."'

parser = Chisel.new(File.read('./workfiles/chisel.txt'))
output = parser.document_splitter
puts output
handle = File.open('./workfiles/parsed.txt', 'w')
handle.write(output)
handle.close

