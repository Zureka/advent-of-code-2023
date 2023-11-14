defmodule Day12.Part1 do
  def solve(_input) do
  end
end

defmodule Day12.Part2 do
  def solve(_input) do
  end
end

defmodule Mix.Tasks.Day12 do
  use Mix.Task

  def run(_) do
    {:ok, input} = File.read("inputs/day12-input.txt")

    IO.puts("--- Part 1 ---")
    IO.puts(Day12.Part1.solve(input))
    IO.puts("")
    IO.puts("--- Part 2 ---")
    IO.puts(Day12.Part2.solve(input))
  end
end
