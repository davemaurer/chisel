class Emphasizer
  attr_reader :markdown_text

  def initialize(markdown_text)
    @markdown_text = markdown_text
  end

  def substitute
    markdown_text.gsub!('&', '&amp;') if markdown_text.include?('&')
    markdown_text.gsub!('**', '<strong>') if markdown_text.include?('**')
    markdown_text.gsub!('*', '<em>') if markdown_text.include?('*')
    markdown_text
  end

  def emphasize
    emphasized = substitute.split(/ /).map do |word|
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
end
