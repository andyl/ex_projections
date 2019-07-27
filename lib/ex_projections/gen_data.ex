defmodule ExProjections.GenData do
  def mix_project do
    %{
      "lib/*.ex" => %{
        "alternate" => "test/{}_test.exs",
        "type" => "src"
      },
      "test/*_test.exs" => %{
        "alternate" => "lib/{}.ex",
        "type" => "test"
      }
    }
  end

  def umbrella_project(list) do
    list
    |> Enum.reduce(%{}, &all_map/2)
  end

  defp all_map(dir, acc) do
    acc
    |> Map.merge(src_map(dir))
    |> Map.merge(test_map(dir))
  end

  defp src_map(dir) do
    %{
      "apps/#{dir}/lib/*.ex" => %{
        "type" => "src",
        "alternate" => "apps/#{dir}/test/{}_test.exs"
      }
    }
  end

  defp test_map(dir) do
    %{
      "apps/#{dir}/test/*_test.exs" => %{
        "type" => "src",
        "alternate" => "apps/#{dir}/lib/{}.ex"
      }
    }
  end
end
