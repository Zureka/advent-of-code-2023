defmodule Day04.Part1 do
  def solve(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&String.split(&1, ":", trim: true))
    |> Enum.map(fn [_, numbers] ->
      [winners, values] =
        numbers
        |> String.split("|", trim: true)

      winners =
        winners
        |> String.split(" ", trim: true)
        |> Enum.map(&String.to_integer/1)

      values =
        values
        |> String.split(" ", trim: true)
        |> Enum.map(&String.to_integer/1)

      numWinners =
        Enum.reduce(values, 0, fn value, acc ->
          if value in winners, do: acc + 1, else: acc
        end)

      calc_points(numWinners)
    end)
    |> Enum.sum()
  end

  defp calc_points(0), do: 0
  defp calc_points(1), do: 1
  defp calc_points(count), do: :math.pow(2, count - 1)
end

defmodule Day04.Part2 do
  def solve(input) do
    input
    |> String.split("\n", trim: true)
  end
end

defmodule Mix.Tasks.Day04 do
  use Mix.Task

  def run(_) do
    {:ok, input} = File.read("inputs/day04-input.txt")

    IO.puts("--- Part 1 ---")
    IO.puts(Day04.Part1.solve(input))
    IO.puts("")
    IO.puts("--- Part 2 ---")
    IO.puts(Day04.Part2.solve(input))
  end
end
