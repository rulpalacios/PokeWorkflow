class InsertPokemonsJob < Gush::Job
  def perform
    pokemons = data['pokemons']['results']
    pokemons.each do |pokemon|
      Pokemon.create(name: pokemon['name'], url: pokemon['url'])
    end
  end
end