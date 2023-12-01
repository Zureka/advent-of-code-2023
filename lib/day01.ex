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
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&parseDigits/1)
    |> Enum.sum()
  end

  def parseDigits(line) do
    ~r/(?=(\d|one|two|three|four|five|six|seven|eight|nine))/
    |> Regex.scan(line)
    |> List.flatten()
    |> Enum.map(fn digit ->
      case digit do
        "one" -> "1"
        "two" -> "2"
        "three" -> "3"
        "four" -> "4"
        "five" -> "5"
        "six" -> "6"
        "seven" -> "7"
        "eight" -> "8"
        "nine" -> "9"
        _ -> digit
      end
    end)
    |> Enum.filter(fn digit ->
      digit in ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
    end)
    |> Kernel.then(fn nums ->
      first = hd(nums)
      last = List.last(nums)
      String.to_integer(first <> last)
    end)
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
