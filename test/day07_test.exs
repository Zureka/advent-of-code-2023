defmodule Day07Test do
  use ExUnit.Case

  test "solves example input for part 1" do
    input = """
    32T3K 765
    T55J5 684
    KK677 28
    KTJJT 220
    QQQJA 483
    """

    assert Day07.Part1.solve(input) == 6440
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

  test "solves example input for part 2" do
    input = """
    32T3K 765
    T55J5 684
    KK677 28
    KTJJT 220
    QQQJA 483
    """

    assert Day07.Part2.solve(input) == 5905
  end

  test "detecting a full house in part 2" do
    input = """
    2233J 42
    """

    assert Day07.Part2.solve(input) == 42
  end

  test "another example for part 2" do
    input = """
    2345A 1
    Q2KJJ 13
    Q2Q2Q 19
    T3T3J 17
    T3Q33 11
    2345J 3
    J345A 2
    32T3K 5
    T55J5 29
    KK677 7
    KTJJT 34
    QQQJA 31
    JJJJJ 37
    JAAAA 43
    AAAAJ 59
    AAAAA 61
    2AAAA 23
    2JJJJ 53
    JJJJ2 41
    """

    assert Day07.Part2.solve(input) == 6839
  end
end
