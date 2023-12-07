defmodule Day07.Part1 do
  def solve(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(fn line ->
      [hand, bid] = String.split(line, " ", trim: true)

      hand =
        hand
        |> String.split("", trim: true)
        |> Enum.map(&determine_value/1)

      %{hand: categorize_hand(hand), bid: String.to_integer(bid)}
    end)
    |> Enum.sort_by(fn %{hand: %{strength: strength, cards: [one, two, three, four, five]}} ->
      {strength, one, two, three, four, five}
    end)
    |> Enum.with_index()
    |> Enum.reduce(0, fn {%{bid: bid}, index}, acc ->
      acc + (index + 1) * bid
    end)
  end

  defp determine_value(card) do
    case card do
      "A" -> 14
      "K" -> 13
      "Q" -> 12
      "J" -> 11
      "T" -> 10
      _ -> String.to_integer(card)
    end
  end

  defp categorize_hand(hand) do
    card_counts =
      Enum.group_by(hand, fn c -> c end)
      |> Map.to_list()

    cond do
      Enum.any?(card_counts, fn {_, cards} -> length(cards) == 5 end) ->
        %{type: :five_of_a_kind, strength: 7, cards: hand}

      Enum.any?(card_counts, fn {_, cards} -> length(cards) == 4 end) ->
        %{type: :four_of_a_kind, strength: 6, cards: hand}

      length(Enum.filter(card_counts, fn {_, cards} -> length(cards) == 2 end)) == 1 and
          Enum.any?(card_counts, fn {_, cards} -> length(cards) == 3 end) ->
        %{type: :three_of_a_kind_with_pair, strength: 5, cards: hand}

      Enum.any?(card_counts, fn {_, cards} -> length(cards) == 3 end) ->
        %{type: :three_of_a_kind, strength: 4, cards: hand}

      length(Enum.filter(card_counts, fn {_, cards} -> length(cards) == 2 end)) == 2 ->
        %{type: :two_pairs, strength: 3, cards: hand}

      length(Enum.filter(card_counts, fn {_, cards} -> length(cards) == 2 end)) == 1 ->
        %{type: :one_pair, strength: 2, cards: hand}

      true ->
        %{type: :high_card, strength: 1, cards: hand}
    end
  end
end

defmodule Day07.Part2 do
  def solve(_input) do
  end
end

defmodule Mix.Tasks.Day07 do
  use Mix.Task

  def run(_) do
    {:ok, input} = File.read("inputs/day07-input.txt")

    IO.puts("--- Part 1 ---")
    IO.puts(Day07.Part1.solve(input))
    IO.puts("")
    IO.puts("--- Part 2 ---")
    IO.puts(Day07.Part2.solve(input))
  end
end
