defmodule DungeonCrawl.Cli.RoomActionsChoice do
  alias Mix.Shell.IO, as: Shell
  import DungeonCrawl.Cli.BaseCmds

  def start(room) do
    room_actions = room.actions
    find_action_by_idx = &Enum.at(room_actions, &1)

    Shell.info(room.description)

    chosen_action =
      room_actions
      |> display_options()
      |> ask_for_selection()
      |> Shell.prompt()
      |> parse_selection()
      |> find_action_by_idx.()

    {room, chosen_action}
  end
end
