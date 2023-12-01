defmodule Day01Test do
  use ExUnit.Case

  @example_input_1 """
  1abc2
  pqr3stu8vwx
  a1b2c3d4e5f
  treb7uchet
  """

  @example_input_2 """
  two1nine
  eightwothree
  abcone2threexyz
  xtwone3four
  4nineeightseven2
  zoneight234
  7pqrstsixteen
  """

  test "solves example input for part 1" do
    assert Day01.part_1(@example_input_1) == 142
  end

  test "solves example input for part 2" do
    assert Day01.part_2(@example_input_2) == 281
  end
end
