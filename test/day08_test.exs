defmodule Day08Test do
  use ExUnit.Case

  test "solves example input for part 1" do
    input = """
    RL

    AAA = (BBB, CCC)
    BBB = (DDD, EEE)
    CCC = (ZZZ, GGG)
    DDD = (DDD, DDD)
    EEE = (EEE, EEE)
    GGG = (GGG, GGG)
    ZZZ = (ZZZ, ZZZ)
    """

    IO.inspect(input)

    assert Day08.Part1.solve(input) == {"ZZZ", 2}
  end

  test "solves second example input for part 1" do
    input = """
    LLR

    AAA = (BBB, BBB)
    BBB = (AAA, ZZZ)
    ZZZ = (ZZZ, ZZZ)
    """

    assert Day08.Part1.solve(input) == {"ZZZ", 6}
  end

  @tag :skip
  test "solves example input for part 2" do
    input = """
    """

    assert Day08.Part2.solve(input) == 42
  end
end
