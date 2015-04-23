class Paragrapher
  def paragraph_replacer(string)
    if string.end_with?("\n")
      "<p>\n" + (string) + "</p>\n"
    else
      "<p>\n" + (string) + "\n</p>\n"
    end
  end
end
