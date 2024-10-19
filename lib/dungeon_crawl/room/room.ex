defmodule DungeonCrawl.Room.Room do
  alias DungeonCrawl.Room.Room
  alias DungeonCrawl.Room.Triggers
  import DungeonCrawl.Room.Action

  defstruct description: nil, actions: [], trigger: nil

  def all,
    do: [
      # %Room{
      #   description: "You found a quiet place. Looks safe for a little nap.",
      #   actions: [forward(), rest()],
      #   trigger: Triggers.Exit
      # },
      %Room{
        description: "You can see the light of day. You found the exit",
        actions: [forward()],
        trigger: Triggers.Exit
      },
      %Room{
        description: "There is an enemy blocking your path",
        actions: [forward()],
        trigger: Triggers.Battle
      }
    ]
end
