class DownloadPokemonsJob < Gush::Job
  def perform
    response = HTTParty.get('https://pokeapi.co/api/v2/pokemon?limit=100')
    pokemons = JSON.parse(response.body)
    
    byebug
    store data: { pokemons: pokemons }
  end
end