class PokemonWorkflow < Gush::Workflow
  def configure
    run DownloadPokemonJob
    run InsertPokemonJob, after: DownloadPokemonJob
  end
end