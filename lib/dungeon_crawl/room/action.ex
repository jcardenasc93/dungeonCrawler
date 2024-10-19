defmodule DungeonCrawl.Room.Action do
  alias DungeonCrawl.Room.Action

  defstruct label: nil, id: nil

  @doc """
  Returns a forward 'Action'
  """
  def forward, do: %Action{id: :forward, label: "Move forward."}

  @doc """
  Returns a rest 'Action'
  """
  def rest, do: %Action{id: :rest, label: "Take a better look and rest."}

  @doc """
  Returns a search 'Action'
  """
  def search, do: %Action{id: :search, label: "Search in the room."}

  # NOTE: This implements the String.Chars protocol
  defimpl String.Chars do
    def to_string(action), do: action.label
  end

  @type t :: %Action{id: atom, label: String.t()}
end
