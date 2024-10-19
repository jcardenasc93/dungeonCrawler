defmodule DungeonCrawl.Cli.BaseCmds do
  alias Mix.Shell.IO, as: Shell

  def display_options(options) do
    options
    |> Enum.with_index(1)
    |> Enum.each(fn {option, index} ->
      Shell.info("#{index}: #{option}")
    end)

    options
  end

  def ask_for_selection(options) do
    options = Enum.join(1..Enum.count(options), ",")
    "Select one [#{options}]\n"
  end

  def parse_selection(selection) do
    {option, _} = Integer.parse(selection)
    option - 1
  end
end
