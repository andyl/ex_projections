defmodule ExProjections.MixProject do
  use Mix.Project

  def project do
    [
      app: :ex_projections,
      version: "0.1.0",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      escript: escript()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:jason, "~> 1.1"},
      {:ex_doc, "~> 0.19"}
    ]
  end

  defp escript do
    [main_module: ExProjections.Cli]
  end
end
