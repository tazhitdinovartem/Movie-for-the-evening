require "nokogiri"
require "open-uri"
require_relative "lib/film"
require_relative "lib/film_collection"
require_relative "lib/parsing_collection"

# Для теста подтягивания фильмов из файлов
# films_path = Dir["#{__dir__}/data/films/*"]
# films = FilmCollection.create_collection_from_files(films_path)

parsed_films = ParsingCollection.from_imdb
films = FilmCollection.create_collection_from_parsing(parsed_films)
films_directors = films.get_directors_from_collection

puts "Программа «Фильм на вечер» \n\n"

puts films.show_directors

user_input = STDIN.gets.to_i

until (1..films_directors.count).include?(user_input) do
  puts "Выберите номер режиссера"
  user_input = STDIN.gets.to_i
end

puts "И сегодня вечером рекомендую посмотреть:\n\
#{films.select_film_by_director(user_input)}"
