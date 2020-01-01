require 'rspec'
require_relative '../lib/film_collection'
require_relative '../lib/film'

describe FilmCollection do
  film_path = Dir["fixtures/*.txt"]
  films = FilmCollection.create_collection(film_path)

  it 'should be an array' do
    expect(films.class).to eq Array
  end

  it 'should contain Film objects' do
    expect(films[0].title).to eq "Начало"
    expect(films[0].director).to eq "Кристофер Нолан"
    expect(films[0].year).to eq 2010
  end
end
