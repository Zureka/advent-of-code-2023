defmodule Day01 do
  def part_1(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(fn line ->
      digits =
        ~r/\d/
        |> Regex.scan(line)
        |> List.flatten()

      first = hd(digits)
      last = List.last(digits)
      first <> last
    end)
    |> Enum.map(&String.to_integer/1)
    |> Enum.sum()
  end

  def part_2(input) do
  end
end

defmodule Mix.Tasks.Day01 do
  use Mix.Task

  def run(_) do
    {:ok, input} = File.read("inputs/day01-input.txt")

    IO.puts("--- Part 1 ---")
    IO.puts(Day01.part_1(input))
    IO.puts("")
    IO.puts("--- Part 2 ---")
    IO.puts(Day01.part_2(input))
  end
end
