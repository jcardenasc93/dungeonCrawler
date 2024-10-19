defmodule DungeonCrawl.Cli.Main do
  alias Mix.Shell.IO, as: Shell

  def start_game do
    welcome_msg()
    Shell.prompt("Press Enter to continue")
    crawl(hero_choice(), DungeonCrawl.Room.Room.all())
  end

  defp welcome_msg do
    Shell.info("===== Dungeon Crawl 0.0.1 ====")
    Shell.info("You awake in a dungeon full of monsters.")
    Shell.info("You need to survive and find the exit")
  end

  defp hero_choice do
    DungeonCrawl.Cli.HeroChoice.start()
    |> set_player_name()
  end

  defp set_player_name(hero) do
    player_name = Shell.prompt("Enter player name:\n")
    %{hero | name: player_name}
  end

  defp trigger_action({room, action}, character) do
    Shell.cmd("clear")
    room.trigger.run(character, action)
  end

  # Handles trigger result in order to perform the correct action
  defp handle_result({_, :exit}), do: Shell.info("You find the exit and won the game.\nCongrats!")
  defp handle_result({character, _}), do: crawl(character, DungeonCrawl.Room.Room.all())

  defp crawl(%{hit_points: 0}, _) do
    Shell.prompt("")
    Shell.cmd("clear")
    Shell.info("You fall onto the floor without strength to carry on.")
    Shell.info("You are death.\nGAME OVER!")
    Shell.prompt("")
  end

  defp crawl(character, rooms) do
    Shell.info("You keep moving forward to the next room.")
    Shell.prompt("Press any key to continue...")
    Shell.cmd("clear")

    Shell.info(DungeonCrawl.Character.current_stats(character))

    rooms
    |> Enum.random()
    |> DungeonCrawl.Cli.RoomActionsChoice.start()
    |> trigger_action(character)
    |> handle_result
  end
end
