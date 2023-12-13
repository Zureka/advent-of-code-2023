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

  test "solves example input for part 2" do
    input = """
    .....
    .S-7.
    .|.|.
    .L-J.
    .....
    """

    assert Day10.Part2.solve(input) == 1
  end

  test "solves another simple example input for part 2" do
    input = """
    .........
    ...F-7...
    ...S.|...
    ...L-J...
    .........
    """

    assert Day10.Part2.solve(input) == 1
  end

  test "solves another example input for part 2" do
    input = """
    ...........
    .S-------7.
    .|F-----7|.
    .||.....||.
    .||.....||.
    .|L-7.F-J|.
    .|..|.|..|.
    .L--J.L--J.
    ...........
    """

    assert Day10.Part2.solve(input) == 4
  end

  test "solves yet another example input for part 2" do
    input = """
    .F----7F7F7F7F-7....
    .|F--7||||||||FJ....
    .||.FJ||||||||L7....
    FJL7L7LJLJ||LJ.L-7..
    L--J.L7...LJS7F-7L7.
    ....F-J..F7FJ|L7L7L7
    ....L7.F7||L7|.L7L7|
    .....|FJLJ|FJ|F7|.LJ
    ....FJL-7.||.||||...
    ....L---J.LJ.LJLJ...
    """

    assert Day10.Part2.solve(input) == 8
  end

  test "solves yet yet another example input for part 2" do
    input = """
    FF7FSF7F7F7F7F7F---7
    L|LJ||||||||||||F--J
    FL-7LJLJ||||||LJL-77
    F--JF--7||LJLJ7F7FJ-
    L---JF-JLJ.||-FJLJJ7
    |F|F-JF---7F7-L7L|7|
    |FFJF7L7F-JF7|JL---7
    7-L-JL7||F7|L7F-7F7|
    L.L7LFJ|||||FJL7||LJ
    L7JLJL-JLJLJL--JLJ.L
    """

    assert Day10.Part2.solve(input) == 10
  end
end
