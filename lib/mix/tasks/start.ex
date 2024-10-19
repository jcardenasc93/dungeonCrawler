defmodule Mix.Tasks.Start do
  @moduledoc """
  Game start mix task
  """
  use Mix.Task

  @doc """
  Exec entry point for the start task
  """
  def run(_), do: DungeonCrawl.Cli.Main.start_game()
end
