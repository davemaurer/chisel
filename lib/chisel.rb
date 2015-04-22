require_relative "header"
require_relative "paragrapher"
require_relative "emphasis"
require 'pry'

class Chisel
  attr_reader :markdown_file, :html_file

  def initialize(markdown_file, html_file =nil)
    @markdown_file = markdown_file
    @html_file = html_file
  end

  def emphasized_text
    Emphasis.new(markdown_file).emphasize
  end

  def split_text
    emphasized_text.split("\n\n")
  end

  def parse
    parsed_document = []
    split_text.each do |string|
      if string.start_with?("#")
        parsed_document << Header.new.header_replacer(string)
      else
        parsed_document << Paragrapher.new.paragraph_replacer(string)
      end
    end
    parsed_document.join
  end

end
