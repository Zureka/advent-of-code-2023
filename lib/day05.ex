defmodule Day05.Part1 do
  def solve(input) do
    [
      seeds,
      seed_conversion,
      soil_conversion,
      fertilizer_conversion,
      water_conversion,
      light_conversion,
      temp_conversion,
      humidity_conversion
    ] =
      process(input)

    seeds
    |> map_values(seed_conversion)
    |> map_values(soil_conversion)
    |> map_values(fertilizer_conversion)
    |> map_values(water_conversion)
    |> map_values(light_conversion)
    |> map_values(temp_conversion)
    |> map_values(humidity_conversion)
    |> Enum.min()
  end

  def process(input) do
    input
    |> String.split("\n\n", trim: true)
    |> Enum.map(&String.split(&1, ":", trim: true))
    |> Enum.map(&parse_info/1)
  end

  defp parse_info(["seeds", values]) do
    String.split(values, " ", trim: true) |> Enum.map(&String.to_integer/1)
  end

  defp parse_info([_, values]) do
    values
    |> String.split("\n", trim: true)
    |> Enum.map(&String.split(&1, " ", trim: true))
    |> Enum.map(fn conversions ->
      conversions
      |> Enum.map(&String.to_integer/1)
    end)
    |> Enum.map(fn [destination, source, length] ->
      %{
        source: source..(source + length - 1),
        destination: destination..(destination + length - 1),
        length: length
      }
    end)
  end

  defp map_values(values, conversions) do
    values
    |> Enum.map(fn value ->
      conversions
      |> Enum.reduce_while(value, fn %{source: sources, destination: destinations}, acc ->
        source_start..source_end = sources

        if value < source_start or value > source_end do
          {:cont, acc}
        else
          index = value - source_start

          case Enum.at(destinations, index) do
            nil -> {:cont, acc}
            dest -> {:halt, dest}
          end
        end
      end)
    end)
  end
end

defmodule Day05.Part2 do
  def solve(_input) do
  end
end

defmodule Mix.Tasks.Day05 do
  use Mix.Task

  def run(_) do
    {:ok, input} = File.read("inputs/day05-input.txt")

    IO.puts("--- Part 1 ---")
    IO.puts(Day05.Part1.solve(input))
    IO.puts("")
    IO.puts("--- Part 2 ---")
    IO.puts(Day05.Part2.solve(input))
  end
end
