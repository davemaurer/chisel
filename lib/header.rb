#if # sub with <h1>
#etc. ##, ###, ####, #####
#if !# puts chunk

class Header

  def header_replacer(string)
    string_count = string.count("#")
    if string_count == 5
      string.gsub("##### ", "<h5>") + "</h5>\n\n"
    elsif string_count == 4
      string.gsub("#### ", "<h4>") + "</h4>\n\n"
    elsif string_count == 3
      string.gsub("### ", "<h3>") + "</h3>\n\n"
    elsif string_count == 2
      string.gsub("## ", "<h2>") + "</h2>\n\n"
    elsif string_count == 1
      string.gsub("# ", "<h1>") + "</h1>\n\n"
    end
  end
end
