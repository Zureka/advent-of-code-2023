defmodule Day02.Part1 do
  def solve(input) do
    games =
      input
      |> String.split("\n", trim: true)
      |> Enum.map(&parse_game/1)

    Enum.reduce(games, 0, fn game, acc ->
      validity =
        game.rounds
        |> List.flatten()
        |> Enum.map(&validateCubes/1)
        |> Enum.all?(fn x -> x end)

      if validity do
        acc + game.id
      else
        acc
      end
    end)
  end

  defp parse_game(line) do
    [game, rounds] = String.split(line, ":", trim: true)

    id =
      ~r/(\d+)/
      |> Regex.scan(game)
      |> Enum.map(fn [_, game_id] -> String.to_integer(game_id) end)

    parsed_rounds =
      rounds
      |> String.split(";", trim: true)
      |> Enum.map(fn round -> String.split(round, ",") end)
      |> Enum.map(fn round ->
        Enum.map(round, fn card ->
          [count, color] = String.split(card, " ", trim: true)
          %{count: String.to_integer(count), color: color}
        end)
      end)

    %{id: hd(id), rounds: parsed_rounds}
  end

  defp validateCubes(%{color: "red", count: count}) do
    count <= 12
  end

  defp validateCubes(%{color: "green", count: count}) do
    count <= 13
  end

  defp validateCubes(%{color: "blue", count: count}) do
    count <= 14
  end
end

defmodule Day02.Part2 do
  def solve(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&parse_game/1)
    |> Enum.map(&determine_power/1)
    |> Enum.sum()
  end

  defp parse_game(line) do
    [game, rounds] = String.split(line, ":", trim: true)

    id =
      ~r/(\d+)/
      |> Regex.scan(game)
      |> Enum.map(fn [_, game_id] -> String.to_integer(game_id) end)

    parsed_rounds =
      rounds
      |> String.split(";", trim: true)
      |> Enum.map(fn round -> String.split(round, ",") end)
      |> Enum.map(fn round ->
        Enum.map(round, fn card ->
          [count, color] = String.split(card, " ", trim: true)
          %{count: String.to_integer(count), color: color}
        end)
      end)
      |> List.flatten()
      |> Enum.sort_by(fn x -> x.count end, :desc)
      |> Enum.group_by(fn x -> x.color end)

    %{id: hd(id), rounds: parsed_rounds}
  end

  defp determine_power(%{
         rounds: %{"blue" => [top_blue | _], "red" => [top_red | _], "green" => [top_green | _]}
       }) do
    top_blue.count * top_red.count * top_green.count
  end
end

defmodule Mix.Tasks.Day02 do
  use Mix.Task

  def run(_) do
    {:ok, input} = File.read("inputs/day02-input.txt")

    IO.puts("--- Part 1 ---")
    IO.puts(Day02.Part1.solve(input))
    IO.puts("")
    IO.puts("--- Part 2 ---")
    IO.puts(Day02.Part2.solve(input))
  end
end
