class InsertPokemonsJob < Gush::Job
  def perform

    Rails.logger.info "Getting payloads..."
    pokemons = payloads.first[:output]
    Rails.logger.info "Got #{pokemons.count} pokemons"

    Rails.logger.info "Inserting pokemons..."
    pokemons.each do |pokemon|
      Rails.logger.info "Inserting #{pokemon[:name]}"
      Pokemon.create(name: pokemon[:name], url: pokemon[:url])
    end
    Rails.logger.info "Inserted #{pokemons.count} pokemons"
  end
end