class DownloadPokemonsJob < Gush::Job
  def perform
    Rails.logger.info "Downloading..."

    response = HTTParty.get('https://pokeapi.co/api/v2/pokemon?limit=100')
    pokemons = JSON.parse(response.body)

    Rails.logger.info "Downloaded #{pokemons['results'].count} pokemons"
    
    output(pokemons['results'])
  end
end