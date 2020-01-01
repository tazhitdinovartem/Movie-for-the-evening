class FilmCollection
  attr_reader :collection
  def initialize(collection = [])
    @collection = collection
  end

  def self.create_collection_from_files(films_path)
    new(
      films_path.
      map { |path| File.readlines(path, encoding: "UTF-8", chomp: true) }.
      map { |lines| Film.new(lines[0], lines[1], lines[2].to_i) }
    )
  end

  def get_directors_from_collection
    @collection.map(&:director).uniq
  end

  def select_film_by_director(user_input, films_directors)
    @collection.select { |film| film.director == films_directors[user_input - 1] }.sample
  end
end
