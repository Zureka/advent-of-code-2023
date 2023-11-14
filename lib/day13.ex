defmodule Day13.Part1 do
  def solve(_input) do
  end
end

defmodule Day13.Part2 do
  def solve(_input) do
  end
end

defmodule Mix.Tasks.Day13 do
  use Mix.Task

  def run(_) do
    {:ok, input} = File.read("inputs/day13-input.txt")

    IO.puts("--- Part 1 ---")
    IO.puts(Day13.Part1.solve(input))
    IO.puts("")
    IO.puts("--- Part 2 ---")
    IO.puts(Day13.Part2.solve(input))
  end
end
