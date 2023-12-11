defmodule Day09.Part1 do
  def solve(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(fn line ->
      String.split(line, " ", trim: true)
      |> Enum.map(&String.to_integer/1)
      |> process()
    end)
    |> Enum.sum()
  end

  defp process(values) do
    cond do
      Enum.all?(values, fn v -> v == 0 end) ->
        0

      true ->
        end_value =
          values
          |> Enum.chunk_every(2, 1, :discard)
          |> Enum.map(fn [a, b] -> b - a end)
          |> process()

        List.last(values) + end_value
    end
  end
end

defmodule Day09.Part2 do
  def solve(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(fn line ->
      String.split(line, " ", trim: true)
      |> Enum.map(&String.to_integer/1)
      |> process()
    end)
    |> Enum.sum()
  end

  defp process(values) do
    cond do
      Enum.all?(values, fn v -> v == 0 end) ->
        0

      true ->
        [first | _] = values

        end_value =
          values
          |> Enum.chunk_every(2, 1, :discard)
          |> Enum.map(fn [a, b] -> a - b end)
          |> process()

        first + end_value
    end
  end
end

defmodule Mix.Tasks.Day09 do
  use Mix.Task

  def run(_) do
    {:ok, input} = File.read("inputs/day09-input.txt")

    IO.puts("--- Part 1 ---")
    IO.puts(Day09.Part1.solve(input))
    IO.puts("")
    IO.puts("--- Part 2 ---")
    IO.puts(Day09.Part2.solve(input))
  end
end
