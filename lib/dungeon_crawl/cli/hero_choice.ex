defmodule DungeonCrawl.Cli.HeroChoice do
  alias Mix.Shell.IO, as: Shell
  import DungeonCrawl.Cli.BaseCmds

  def start do
    Shell.cmd("clear")
    Shell.info("Choose your hero:")

    heroes = DungeonCrawl.Heroes.all()
    find_hero_by_index = &Enum.at(heroes, &1)

    heroes
    |> display_options()
    |> ask_for_selection()
    |> Shell.prompt()
    |> parse_selection()
    |> find_hero_by_index.()
    |> confirm()
  end

  defp confirm(hero) do
    Shell.info("You selected #{hero.name}")
    Shell.info("#{hero.description}")

    if Shell.yes?("Do you want to continue?"),
      do: Shell.info("#{hero.name} has been selected"),
      else: start()

    hero
  end
end
