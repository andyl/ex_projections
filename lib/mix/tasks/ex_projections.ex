defmodule Mix.Tasks.ExProjections do
  use Mix.Task

  @shortdoc "Write vim-projectionist file"

  @moduledoc """
  See the source at http://github.com/andyl/ex_projections
  """

  def run(_args) do
    ExProjections.Write.to_file
  end
end
