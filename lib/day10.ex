defmodule Day10.Part1 do
  def solve(input) do
    tiles =
      input
      |> String.split("\n", trim: true)
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

    pipes = process_tiles(tiles, [start], [start])

    Enum.filter(tiles, fn tile -> tile not in pipes end)
    |> Enum.map(fn not_pipe ->
      num_intersects =
        Enum.filter(tiles, fn {_, row, col} ->
          elem(not_pipe, 1) == row and elem(not_pipe, 2) > col
        end)
        |> Enum.reduce(0, fn t, acc ->
          case {Enum.member?(pipes, t), elem(t, 0)} do
            {true, "S"} -> acc + 1
            {true, "|"} -> acc + 1
            {true, "L"} -> acc + 1
            {true, "J"} -> acc + 1
            {_, _} -> acc
          end
        end)

      cond do
        num_intersects == 0 -> false
        rem(num_intersects, 2) == 0 -> false
        true -> true
      end
    end)
    |> Enum.count(fn within_pipes -> within_pipes end)
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

  defp visualize_loop(tiles, pipes, num_rows) do
    num_cols = div(length(tiles), num_rows)

    tiles
    |> Enum.map(fn tile ->
      if tile in pipes do
        "#{IO.ANSI.red()}#{elem(tile, 0)}"
      else
        "#{IO.ANSI.white()}O"
      end
    end)
    |> Enum.chunk_every(num_cols)
    |> Enum.with_index()
    |> Enum.map(fn {chunk, index} ->
      Enum.with_index(chunk)
      |> Enum.filter(fn {tile, _} -> !String.contains?(tile, "O") end)

      "#{index} \t #{Enum.join(chunk)}"
    end)
    |> Enum.each(&IO.puts/1)
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
