defmodule Day06.Part1 do
  def solve(input) do
    [times, distances] =
      input
      |> String.split("\n", trim: true)
      |> Enum.map(fn line ->
        [_label | values] = String.split(line, ~r/\s+/, trim: true)
        values |> Enum.map(&String.to_integer/1)
      end)

    Enum.zip(times, distances)
    |> Enum.reduce(1, fn {time, distance}, acc ->
      numWins =
        length(
          1..time
          |> Enum.filter(fn hold_time ->
            dist = hold_time * (time - hold_time)
            dist > distance
          end)
        )

      numWins * acc
    end)
  end
end

defmodule Day06.Part2 do
  def solve(_input) do
  end
end

defmodule Mix.Tasks.Day06 do
  use Mix.Task

  def run(_) do
    {:ok, input} = File.read("inputs/day06-input.txt")

    IO.puts("--- Part 1 ---")
    IO.puts(Day06.Part1.solve(input))
    IO.puts("")
    IO.puts("--- Part 2 ---")
    IO.puts(Day06.Part2.solve(input))
  end
end
