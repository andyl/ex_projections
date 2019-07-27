defmodule ExProjection.GenDataTest do
  use ExUnit.Case
  alias ExProjections.GenData
  doctest ExProjections.GenData

  describe ".mix_project" do
    test "returns a map" do
      assert %{} = GenData.mix_project()
    end
  end

  describe ".umbrella_project" do
    test "returns a map" do
      assert %{} = GenData.umbrella_project(["a"])
    end
  end
end
