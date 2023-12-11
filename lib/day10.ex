defmodule Day10.Part1 do
  def solve(input) do
    rows = String.split(input, "\n", trim: true)

    tiles =
      rows
      |> Enum.with_index()
      |> Enum.map(fn {line, row} ->
        String.codepoints(line)
        |> Enum.with_index()
        |> Enum.map(fn {tile, col} ->
          {tile, row, col}
        end)
      end)
      |> List.flatten()

    start =
      tiles
      |> Enum.find(fn {char, _row, _col} -> char == "S" end)

    process_tiles(tiles, [start], [start])

    div(length(process_tiles(tiles, [start], [start])), 2)
  end

  defp process_tiles(_tiles, [], seen), do: seen

  defp process_tiles(tiles, queue, seen) do
    {tile, rest} = List.pop_at(queue, 0)

    {q, s} =
      get_nearby_pipes(tiles, tile)
      |> Enum.reduce({rest, seen}, fn t, {rq, rs} ->
        if !is_nil(t) and t not in rs do
          {rq ++ [t], [t | rs]}
        else
          {rq, rs}
        end
      end)

    process_tiles(tiles, q, s)
  end

  defp get_nearby_pipes(tiles, tile) do
    {ch, row, col} = tile

    top =
      Enum.find(tiles, fn {t, r, c} ->
        r == row - 1 and c == col and String.contains?("S|JL", ch) and String.contains?("|7F", t)
      end)

    bottom =
      Enum.find(tiles, fn {t, r, c} ->
        r == row + 1 and c == col and String.contains?("S|7F", ch) and String.contains?("|JL", t)
      end)

    left =
      Enum.find(tiles, fn {t, r, c} ->
        r == row and c == col - 1 and String.contains?("S-J7", ch) and String.contains?("-LF", t)
      end)

    right =
      Enum.find(tiles, fn {t, r, c} ->
        r == row and c == col + 1 and String.contains?("S-LF", ch) and String.contains?("-J7", t)
      end)

    [top, bottom, left, right]
  end
end

defmodule Day10.Part2 do
  def solve(_input) do
  end
end

defmodule Mix.Tasks.Day10 do
  use Mix.Task

  def run(_) do
    {:ok, input} = File.read("inputs/day10-input.txt")

    IO.puts("--- Part 1 ---")
    IO.puts(Day10.Part1.solve(input))
    IO.puts("")
    IO.puts("--- Part 2 ---")
    IO.puts(Day10.Part2.solve(input))
  end
end
