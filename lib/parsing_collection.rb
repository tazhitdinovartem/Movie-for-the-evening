class ParsingCollection
  IMDB_URL = "https://www.imdb.com/chart/top/?ref_=nv_mv_250"
  
  def self.from_imdb
    html = open(IMDB_URL)
    doc = Nokogiri::HTML(html)
    html.close
    doc.css(".chart .titleColumn").
    map do |element|
      title = element.css("a").text
      year = element.css(".secondaryInfo").text.tr("()","")
      director = element.css("a").attribute("title").value.scan(/.*\(/)[0].delete_suffix(" (")
      [title, director, year]
    end.
    map { |prop| Film.new(prop[0], prop[1], prop[2].to_i) }
  end
end
