class FilmCollection
  def self.from_imdb
    new(ParsingCollection.from_imdb)
  end

  def self.create_collection_from_files(films_path)
    new(
      films_path.
      map { |path| File.readlines(path, encoding: "UTF-8", chomp: true) }.
      map { |lines| Film.new(lines[0], lines[1], lines[2].to_i) }
    )
  end

  def initialize(collection = [])
    @collection = collection
  end

  def show_directors
    get_directors_from_collection.map.with_index(1) do |director, i|
      "#{i}: #{director}"
    end
  end

  def get_directors_from_collection
    @collection.map(&:director).uniq
  end

  def select_film_by_director(user_input)
    @collection.select { |film| film.director == get_directors_from_collection[user_input - 1] }.sample
  end
end
