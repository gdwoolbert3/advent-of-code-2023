defmodule AdventOfCode2023.Day1.Problem1Test do
  use AdventOfCode2023.TestCase, async: true

  alias AdventOfCode2023.Day1.Problem1

  describe "run/1" do
    test "sample input" do
      input = [
        "1abc2",
        "pqr3stu8vwx",
        "a1b2c3d4e5f",
        "treb7uchet"
      ]

      assert Problem1.run(input) == 142
    end

    test "actual input" do
      input = stream_input(1)
      assert Problem1.run(input) == 55_621
    end
  end
end
