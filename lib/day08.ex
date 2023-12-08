defmodule Day08.Part1 do
  def solve(input) do
    [instructions, nodes] =
      input
      |> String.split("\n\n", trim: true)

    instructions = String.split(instructions, "", trim: true)

    instructions =
      1..100
      |> Enum.map(fn _ -> instructions end)
      |> List.flatten()

    nodes =
      nodes
      |> String.split("\n", trim: true)
      |> Enum.with_index()
      |> Enum.reduce(%{}, fn {line, index}, acc ->
        [key, left, right] =
          ~r/[A-Z]{3}/
          |> Regex.scan(line)
          |> List.flatten()

        Map.put(acc, key, %{left: left, right: right, index: index})
      end)

    instructions
    |> Enum.reduce_while({"AAA", 0}, fn step, {node, count} ->
      if node == "ZZZ" do
        {:halt, {node, count}}
      else
        %{left: left, right: right} = Map.get(nodes, node)

        case step do
          "L" -> {:cont, {left, count + 1}}
          "R" -> {:cont, {right, count + 1}}
        end
      end
    end)
  end
end

defmodule Day08.Part2 do
  def solve(_input) do
  end
end

defmodule Mix.Tasks.Day08 do
  use Mix.Task

  def run(_) do
    {:ok, input} = File.read("inputs/day08-input.txt")

    IO.puts("--- Part 1 ---")
    IO.inspect(Day08.Part1.solve(input))
    IO.puts("")
    IO.puts("--- Part 2 ---")
    IO.inspect(Day08.Part2.solve(input))
  end
end
