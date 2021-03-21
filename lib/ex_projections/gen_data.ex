defmodule ExProjections.GenData do
  @projections_path Path.join(:code.priv_dir(:ex_projections), "projections.json")

  def mix_project do
    read_projections(@projections_path)
  end

  def umbrella_project(list) do
    list
    |> Enum.flat_map(fn app_path ->
      read_projections(@projections_path)
      |> Enum.map(&generate_umbrella_entry(app_path, &1))
    end)
    |> Map.new()
  end

  def generate_umbrella_entry(app_path, {k, v}) do
        {get_new_path(app_path, k), maybe_update_alternate(app_path, v)}
  end

  def get_new_path(app_path, template) do
    app_path <> "/" <> template
  end

  def maybe_update_alternate(app_path, template) do
    if Map.has_key?(template, "alternate") do
      Map.update!(template, "alternate", &get_new_path(app_path, &1))
    else
      template
    end
  end

  def read_projections(path) do
    File.read!(path)
    |> Jason.decode!()
  end
end
