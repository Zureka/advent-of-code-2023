defmodule Day03Test do
  use ExUnit.Case

  @example_input """
  467..114..
  ...*......
  ..35..633.
  ......#...
  617*......
  .....+.58.
  ..592.....
  ......755.
  ...$.*....
  .664.598..
  """

  test "solves example input for part 1" do
    assert Day03.Part1.solve(@example_input) == 4361
  end

  test "alternate example 1" do
    input = """
    ........
    .24..4..
    ......*.
    """

    assert Day03.Part1.solve(input) == 4
  end

  test "alternate example 2" do
    input = """
    ........
    .24$-4..
    ......*.
    """

    assert Day03.Part1.solve(input) == 28
  end

  test "alternate example 3" do
    input = """
    11....11
    ..$..$..
    11....11
    """

    assert Day03.Part1.solve(input) == 44
  end

  test "alternate example 4" do
    input = """
    $......$
    .1....1.
    .1....1.
    $......$
    """

    assert Day03.Part1.solve(input) == 4
  end

  test "alternate example 5" do
    input = """
    $......$
    .11..11.
    .11..11.
    $......$
    """

    assert Day03.Part1.solve(input) == 44
  end

  test "alternate example 6" do
    input = """
    $11
    ...
    11$
    ...
    """

    assert Day03.Part1.solve(input) == 22
  end

  test "alternate example 7" do
    input = """
    $..
    .11
    .11
    $..
    ..$
    11.
    11.
    ..$
    """

    assert Day03.Part1.solve(input) == 44
  end

  test "alternate example 8" do
    input = """
    11.$.
    """

    assert Day03.Part1.solve(input) == 0
  end

  test "alternate example 9" do
    input = """
    .......5......
    ..7*..*.....4*
    ...*13*......9
    .......15.....
    ..............
    ..............
    ..............
    ..............
    ..............
    ..............
    21............
    ...*9.........
    """

    assert Day03.Part1.solve(input) == 62
  end

  test "solves example input for part 2" do
    assert Day03.Part2.solve(@example_input) == 467_835
  end

  test "part 2 - alternate example 1" do
    input = """
    ...5*10...
    """

    assert Day03.Part2.solve(input) == 50
  end

  test "part 2 - alternate example 2" do
    input = """
    .......5......
    ..7*..*.....4*
    ...*13*......9
    .......15.....
    ..............
    ..............
    ..............
    ..............
    ..............
    ..............
    21............
    ...*9.........
    """

    assert Day03.Part2.solve(input) == 478
  end
end
