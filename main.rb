require_relative "lib/film"
require_relative "lib/film_collection"

films_path = Dir["#{__dir__}/data/films/*"]
films = FilmCollection.create_collection_from_files(films_path)
films_directors = films.get_directors_from_collection

puts "Программа «Фильм на вечер» \n\n"

films_directors.each.with_index(1) do |director, i|
  puts "#{i}: #{director}"
end

user_input = STDIN.gets.to_i

until (1..films_directors.count).include?(user_input) do
  puts "Выберите номер режиссера"
  user_input = STDIN.gets.to_i
end

selected_film = films.select_film_by_director(user_input)

puts "И сегодня вечером рекомендую посмотреть:"
puts "#{films_directors[user_input - 1]} — #{selected_film}"
