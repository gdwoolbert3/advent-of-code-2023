defmodule AdventOfCode2023.Day2.Problem1Test do
  use AdventOfCode2023.TestCase, async: true

  alias AdventOfCode2023.Day2.Problem1

  describe "run/1" do
    test "sample input" do
      input = [
        "Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green",
        "Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue",
        "Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red",
        "Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red",
        "Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green"
      ]

      assert Problem1.run(input) == 8
    end

    test "actual input" do
      input = stream_input(2)
      assert Problem1.run(input) == 2377
    end
  end
end
