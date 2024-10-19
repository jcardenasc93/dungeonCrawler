defmodule DungeonCrawl.Room.Triggers.Battle do
  @behaviour DungeonCrawl.Room.Trigger

  alias Mix.Shell.IO, as: Shell
  alias DungeonCrawl.Room.Action
  alias DungeonCrawl.Enemies

  def run(character, %Action{id: :forward}) do
    enemy = Enemies.all() |> Enum.random()

    Shell.info(enemy.description)
    Shell.info("#{enemy.name} wants to fight")
    Shell.info("You are prepared and attack first")
    {updated_char, _enemy} = DungeonCrawl.Battle.fight(character, enemy)

    {updated_char, :forward}
  end
end
