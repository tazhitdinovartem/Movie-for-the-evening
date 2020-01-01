class ParsingCollection
  IMDB_URL = "https://www.imdb.com/chart/top/?ref_=nv_mv_250"
  
  def self.parse_collection
    doc = Nokogiri::HTML(open(IMDB_URL))
    films = []
    doc.css(".chart .titleColumn").each do |element|
      title = element.css("a").text
      year = element.css(".secondaryInfo").text.tr("()","")
      director = element.css("a").attribute("title").value.scan(/.*\(/)[0].delete_suffix(" (")
      films << [ title, director, year ]
    end
    films
  end
end
