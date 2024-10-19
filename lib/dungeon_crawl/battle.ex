defmodule DungeonCrawl.Battle do
  alias DungeonCrawl.Character
  alias Mix.Shell.IO, as: Shell

  def fight(char_a = %{hit_points: hit_points_a}, char_b = %{hit_points: hit_points_b})
      when hit_points_a == 0 or hit_points_b == 0,
      do: {char_a, char_b}

  def fight(char_a, char_b) do
    char_b_after_damage = attack(char_a, char_b)
    char_a_after_damage = attack(char_b_after_damage, char_a)
    fight(char_a_after_damage, char_b_after_damage)
  end

  defp attack(%{hit_points: hit_points_a}, char_b) when hit_points_a == 0, do: char_b

  defp attack(char_a, char_b) do
    damage = Enum.random(char_a.damage_range)
    char_b_after_damage = Character.take_damage(char_b, damage)

    char_a
    |> attack_msg(damage)
    |> Shell.info()

    char_b_after_damage
    |> receive_msg(damage)
    |> Shell.info()

    char_b_after_damage
  end

  defp attack_msg(character, damage) do
    "#{character.name} attacks with #{character.attack_description}" <>
      " dealing #{damage} damage points"
  end

  defp receive_msg(character, damage) do
    "#{character.name} -#{damage} hit points:\n#{Character.current_stats(character)}" <>
      "\n---------------------------------------------------------------------"
  end
end
