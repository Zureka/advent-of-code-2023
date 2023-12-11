defmodule Day10Test do
  use ExUnit.Case

  test "solves example input for part 1" do
    input = """
    .....
    .S-7.
    .|.|.
    .L-J.
    .....
    """

    assert Day10.Part1.solve(input) == 4
  end

  test "solves another example input for part 1" do
    input = """
    ..F7.
    .FJ|.
    SJ.L7
    |F--J
    LJ...
    """

    assert Day10.Part1.solve(input) == 8
  end

  @tag :skip
  test "solves example input for part 2" do
    input = """
    .....
    .S-7.
    .|.|.
    .L-J.
    .....
    """

    assert Day10.Part2.solve(input) == 42
  end
end
