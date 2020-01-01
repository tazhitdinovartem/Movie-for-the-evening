require 'rspec'
require_relative '../lib/film'

describe Film do
  it 'should create Film Object' do
    film = Film.new('Начало', 'Кристофер Нолан', 2010)
    expect(film.title).to eq 'Начало'
    expect(film.director).to eq 'Кристофер Нолан'
    expect(film.year).to eq 2010
  end
end
