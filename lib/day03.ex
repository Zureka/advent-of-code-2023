defmodule DigitInfo do
  defstruct index: nil, value: nil
end

defmodule Day03.Part1 do
  def solve(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.with_index()
    |> Enum.map(fn {line, index} ->
      with digits <- ~r/\d+/ |> Regex.scan(line),
           digits_index <- ~r/\d+/ |> Regex.scan(line, return: :index),
           symbols_info <-
             ~r/[^\d|\.]/
             |> Regex.scan(line, return: :index)
             |> Enum.map(fn [{index, _}] ->
               index
             end),
           merged_digits <- Enum.zip(digits, digits_index) do
        digit_info =
          merged_digits
          |> Enum.map(fn {[digit], index} ->
            %DigitInfo{index: index, value: String.to_integer(digit)}
          end)

        %{digit_info: digit_info, symbols_info: symbols_info, index: index}
      end
    end)
    |> validate()
  end

  defp validate(lines) do
    lines
    |> Enum.map(fn current ->
      validate_line(current, lines)
      |> Enum.sum()
    end)
    |> Enum.sum()
  end

  defp validate_line(current, lines) when current.index == length(lines) - 1 do
    with previous_line <- Enum.at(lines, current.index - 1),
         previous_line_valid <- check_nearby_line(current, previous_line),
         current_line_valid <- check_current_line(current) do
      current.digit_info
      |> Enum.zip(current_line_valid)
      |> Enum.zip(previous_line_valid)
      |> Enum.map(fn {{info, current_valid}, previous_valid} ->
        if current_valid or previous_valid do
          info.value
        else
          0
        end
      end)
    end
  end

  defp validate_line(current, lines)
       when current.index == 0 do
    with next_line <- Enum.at(lines, current.index + 1),
         current_line_valid <- check_current_line(current),
         next_line_valid <- check_nearby_line(current, next_line) do
      current.digit_info
      |> Enum.zip(current_line_valid)
      |> Enum.zip(next_line_valid)
      |> Enum.map(fn {{info, current_valid}, next_valid} ->
        if current_valid or next_valid do
          info.value
        else
          0
        end
      end)
    end
  end

  defp validate_line(current, lines) do
    with previous_line <- Enum.at(lines, current.index - 1),
         next_line <- Enum.at(lines, current.index + 1),
         previous_line_valid <- check_nearby_line(current, previous_line),
         current_line_valid <- check_current_line(current),
         next_line_valid <- check_nearby_line(current, next_line) do
      current.digit_info
      |> Enum.zip(current_line_valid)
      |> Enum.zip(previous_line_valid)
      |> Enum.zip(next_line_valid)
      |> Enum.map(fn {{{info, current_valid}, previous_valid}, next_valid} ->
        if current_valid or previous_valid or next_valid do
          info.value
        else
          0
        end
      end)
    end
  end

  defp check_current_line(line) do
    line.digit_info
    |> Enum.map(fn %DigitInfo{index: [{index, length}]} ->
      line.symbols_info
      |> Enum.any?(fn sym_index ->
        sym_index == index - 1 or sym_index == index + length
      end)
    end)
  end

  defp check_nearby_line(line, previous_line) do
    if line.index == previous_line.index do
      [false]
    else
      line.digit_info
      |> Enum.map(fn %DigitInfo{index: [{index, length}], value: value} ->
        previous_line.symbols_info
        |> Enum.any?(fn sym_index ->
          sym_index in Enum.to_list((index - 1)..(index + length))
        end)
      end)
    end
  end
end

defmodule Day03.Part2 do
  def solve(_input) do
  end
end

defmodule Mix.Tasks.Day03 do
  use Mix.Task

  def run(_) do
    {:ok, input} = File.read("inputs/day03-input.txt")

    IO.puts("--- Part 1 ---")
    IO.puts(Day03.Part1.solve(input))
    IO.puts("")
    IO.puts("--- Part 2 ---")
    IO.puts(Day03.Part2.solve(input))
  end
end
