class PokemonWorkflow < Gush::Workflow
  def configure
    run DownloadPokemonsJob
    run InsertPokemonsJob, after: DownloadPokemonsJob
  end
end