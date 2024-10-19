defmodule DungeonCrawl.Room.Trigger do
  alias DungeonCrawl.Character
  alias DungeonCrawl.Room.Action
  @callback run(character :: Character, action :: Action) :: {Character.t(), atom}
end
