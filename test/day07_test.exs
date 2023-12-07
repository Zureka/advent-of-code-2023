defmodule Day07Test do
  use ExUnit.Case

  @example_input """
  32T3K 765
  T55J5 684
  KK677 28
  KTJJT 220
  QQQJA 483
  """

  test "solves example input for part 1" do
    assert Day07.Part1.solve(@example_input) == 6440
  end

  test "solves example input for part 1 in reverse" do
    input = """
    QQQJA 483
    KTJJT 220
    KK677 28
    T55J5 684
    32T3K 765
    """

    assert Day07.Part1.solve(input) == 6440
  end

  test "properly orders based on matching symbols - numbers" do
    input = """
    22241 10
    22243 40
    """

    assert Day07.Part1.solve(input) == 90
  end

  test "properly orders based on matching symbols - suits" do
    input = """
    AKQJ1 10
    AKQJ3 40
    """

    assert Day07.Part1.solve(input) == 90
  end

  @tag :skip
  test "solves example input for part 2" do
    assert Day07.Part2.solve(@example_input) == 42
  end
end
