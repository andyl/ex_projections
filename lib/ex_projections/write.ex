defmodule ExProjections.Write do
  @default_fname "./.projections.json"

  def to_file(fname \\ @default_fname) do
    %{mix: File.exists?('mix.exs'), apps: File.exists?('apps')}
    |> projection_data
    |> write_json(fname)
  end

  defp projection_data(%{mix: false, apps: _}) do
    IO.puts("Not a Mix project - nothing written")
    :no_op
  end

  defp projection_data(%{mix: true, apps: false}) do
    IO.write("Mix project - ")
    ExProjections.GenData.mix_project()
  end

  defp projection_data(%{mix: true, apps: true}) do
    IO.write("Umbrella project - ")

    Path.wildcard("apps/*")
    |> Enum.map(&(String.split(&1, "/") |> List.last()))
    |> ExProjections.GenData.umbrella_project()
  end

  defp write_json(:no_op, _) do
  end

  defp write_json(map, fname) do
    IO.puts("Projections Written to #{fname}")
    {:ok, file} = File.open(fname, [:write])
    json = Jason.encode!(map, pretty: true)
    IO.puts(file, json)
  end
end
