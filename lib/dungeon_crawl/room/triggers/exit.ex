defmodule DungeonCrawl.Room.Triggers.Exit do
  # Implements Exit contract (behaviour)
  @behaviour DungeonCrawl.Room.Trigger

  def run(character, _), do: {character, :exit}
end
