defmodule Day19.Part1 do
  def solve(_input) do
  end
end

defmodule Day19.Part2 do
  def solve(_input) do
  end
end

defmodule Mix.Tasks.Day19 do
  use Mix.Task

  def run(_) do
    {:ok, input} = File.read("inputs/day19-input.txt")

    IO.puts("--- Part 1 ---")
    IO.puts(Day19.Part1.solve(input))
    IO.puts("")
    IO.puts("--- Part 2 ---")
    IO.puts(Day19.Part2.solve(input))
  end
end
