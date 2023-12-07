defmodule AdventOfCode2023.Day1.Problem2Test do
  use AdventOfCode2023.TestCase, async: true

  alias AdventOfCode2023.Day1.Problem2

  describe "run/1" do
    test "sample input" do
      input = [
        "two1nine",
        "eighthree",
        "abcone2threexyz",
        "xtwone3four",
        "4nineeightseven2",
        "zoneight234",
        "7pqrstsixteen"
      ]

      assert Problem2.run(input) == 281
    end

    test "actual input" do
      input = stream_input(1)
      assert Problem2.run(input) == 53592
    end
  end
end
