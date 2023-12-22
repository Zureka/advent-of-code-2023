defmodule Day11Test do
  use ExUnit.Case

  @example_input """
  ...#......
  .......#..
  #.........
  ..........
  ......#...
  .#........
  .........#
  ..........
  .......#..
  #...#.....
  """

  test "solves example input for part 1" do
    assert Day11.Part1.solve(@example_input) == 374
  end

  test "part 1 - calculates properly when galaxies are next to each other" do
    input = "###"
    assert Day11.Part1.solve(input) == 4
  end

  test "part 1 - calculates properly when galaxies are next to each other v2" do
    input = "####"
    assert Day11.Part1.solve(input) == 10
  end

  @tag :skip
  test "solves example input for part 2" do
    assert Day11.Part2.solve(@example_input) == 42
  end
end
