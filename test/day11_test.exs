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
    assert Day11.Part1.solve(@example_input, 2) == 374
  end

  test "part 1 - calculates properly when galaxies are next to each other" do
    input = "###"
    assert Day11.Part1.solve(input, 2) == 4
  end

  test "part 1 - calculates properly when galaxies are next to each other v2" do
    input = "####"
    assert Day11.Part1.solve(input, 2) == 10
  end

  test "solves example input for part 2 expanded by 10" do
    assert Day11.Part2.solve(@example_input, 10) == 1030
  end

  test "solves example input for part 2 expanded by 100" do
    assert Day11.Part2.solve(@example_input, 100) == 8410
  end
end
