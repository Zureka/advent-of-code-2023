defmodule Day08.Part1 do
  def solve(input) do
    {instructions, nodes} = parse(input)
    follow(nodes, instructions, [], "AAA", 0)
  end

  def follow(_nodes, _instructions, _inst, "ZZZ", count), do: count

  def follow(nodes, instructions, [], key, count),
    do: follow(nodes, instructions, instructions, key, count)

  def follow(nodes, instructions, ["L" | rest], key, count) do
    {left, _} = nodes[key]
    follow(nodes, instructions, rest, left, count + 1)
  end

  def follow(nodes, instructions, ["R" | rest], key, count) do
    {_, right} = nodes[key]
    follow(nodes, instructions, rest, right, count + 1)
  end

  def parse(input) do
    [instructions, rest] = String.split(input, "\n\n", trim: true)

    nodes =
      Regex.scan(~r/(.{3}) = \((.{3}), (.{3})\)/, rest, capture: :all_but_first)
      |> Enum.map(fn [k, l, r] -> {k, {l, r}} end)
      |> Enum.into(%{})

    {String.codepoints(instructions), nodes}
  end
end

defmodule Day08.Part2 do
  def solve(input) do
    {instructions, nodes} = Day08.Part1.parse(input)

    Map.keys(nodes)
    |> Enum.filter(&String.ends_with?(&1, "A"))
    |> Enum.map(&follow(nodes, instructions, [], &1, 0))
    |> Enum.reduce(fn x, y -> div(x * y, Integer.gcd(x, y)) end)
  end

  defp follow(nodes, instructions, [], key, count),
    do: follow(nodes, instructions, instructions, key, count)

  defp follow(nodes, instructions, [direction | rest], key, count) do
    index =
      case direction do
        "L" -> 0
        "R" -> 1
      end

    key = elem(nodes[key], index)

    if String.ends_with?(key, "Z") do
      count + 1
    else
      follow(nodes, instructions, rest, key, count + 1)
    end
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
