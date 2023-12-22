defmodule Day11.Part1 do
  def solve(input, size) do
    image =
      input
      |> String.split("\n", trim: true)
      |> Enum.map(&String.to_charlist/1)

    galaxies = find_galaxies(image)
    {x_expansions, y_expansions} = expansions(galaxies)

    galaxies
    |> expand(x_expansions, y_expansions, size - 1)
    |> combinations()
    |> Enum.map(fn {{x1, y1}, {x2, y2}} ->
      abs(x1 - x2) + abs(y1 - y2)
    end)
    |> Enum.sum()
  end

  def expansions(galaxies) do
    xes = Enum.map(galaxies, &elem(&1, 0))
    yes = Enum.map(galaxies, &elem(&1, 1))

    {cals_expansions(xes), cals_expansions(yes)}
  end

  def cals_expansions(vals) do
    max = Enum.max(vals)

    MapSet.difference(MapSet.new(0..max), MapSet.new(vals))
  end

  def expand(galaxies, x_expansions, y_expansions, size) do
    Enum.map(galaxies, fn {x, y} ->
      x_expansion = Enum.filter(x_expansions, &(&1 < x)) |> length()
      y_expansion = Enum.filter(y_expansions, &(&1 < y)) |> length()

      {
        x + x_expansion * size,
        y + y_expansion * size
      }
    end)
  end

  def find_galaxies(image) do
    Enum.reduce(image, {0, []}, fn line, {y, galaxies} ->
      {_, list} =
        Enum.reduce(line, {0, galaxies}, fn ch, {x, g} ->
          case ch do
            ?# -> {x + 1, [{x, y} | g]}
            _ -> {x + 1, g}
          end
        end)

      {y + 1, list}
    end)
    |> elem(1)
  end

  def combinations(list) do
    Enum.flat_map(list, fn g1 ->
      Enum.flat_map(list, fn g2 ->
        if g1 < g2,
          do: [{g1, g2}],
          else: []
      end)
    end)
  end
end

defmodule Day11.Part2 do
  def solve(input, size) do
    Day11.Part1.solve(input, size)
  end
end

defmodule Mix.Tasks.Day11 do
  use Mix.Task

  def run(_) do
    {:ok, input} = File.read("inputs/day11-input.txt")

    IO.puts("--- Part 1 ---")
    IO.puts(Day11.Part1.solve(input, 2))
    IO.puts("")
    IO.puts("--- Part 2 ---")
    IO.puts(Day11.Part2.solve(input, 1_000_000))
  end
end
