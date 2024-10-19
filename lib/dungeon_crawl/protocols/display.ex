defmodule DungeonCrawl.Protocols.Display do
  defprotocol Display do
    @doc """
    Displays type info correctly
    """
    def info(value)
  end

  defimpl DungeonCrawl.Protocols.Display.Display, for: DungeonCrawl.Character do
    def info(character), do: character.name
  end

  defimpl DungeonCrawl.Protocols.Display.Display, for: DungeonCrawl.Room.Action do
    def info(action), do: action.label
  end
end

