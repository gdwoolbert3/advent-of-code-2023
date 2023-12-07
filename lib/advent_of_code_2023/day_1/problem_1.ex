defmodule AdventOfCode2023.Day1.Problem1 do
  @moduledoc """
  Something is wrong with global snow production, and you've been selected
  to take a look. The Elves have even given you a map; on it, they've used
  stars to mark the top fifty locations that are likely to be having problems.

  You've been doing this long enough to know that to restore snow operations,
  you need to check all fifty stars by December 25th.

  Collect stars by solving puzzles. Two puzzles will be made available on each
  day in the Advent calendar; the second puzzle is unlocked when you complete
  the first. Each puzzle grants one star. Good luck!

  You try to ask why they can't just use a weather machine ("not powerful
  enough") and where they're even sending you ("the sky") and why your map
  looks mostly blank ("you sure ask a lot of questions") and hang on did you
  just say the sky ("of course, where do you think snow comes from") when you
  realize that the Elves are already loading you into a trebuchet ("please hold
  still, we need to strap you in").

  As they're making the final adjustments, they discover that their calibration
  document (your puzzle input) has been amended by a very young Elf who was
  apparently just excited to show off her art skills. Consequently, the Elves
  are having trouble reading the values on the document.

  The newly-improved calibration document consists of lines of text; each line
  originally contained a specific calibration value that the Elves now need to
  recover. On each line, the calibration value can be found by combining the
  first digit and the last digit (in that order) to form a single two-digit
  number.

  For example:

      1abc2
      pqr3stu8vwx
      a1b2c3d4e5f
      treb7uchet

  In this example, the calibration values of these four lines are 12, 38, 15,
  and 77. Adding these together produces 142.

  Consider your entire calibration document. What is the sum of all of the
  calibration values?
  """

  ################################
  # Public API
  ################################

  @doc false
  @spec run(Enumerable.t()) :: non_neg_integer()
  def run(lines) do
    lines
    |> Enum.map(&process_line/1)
    |> Enum.reduce(0, fn num, acc -> num + acc end)
  end

  ################################
  # Private API
  ################################

  defp process_line(line) do
    line
    |> String.graphemes()
    |> Enum.reduce({nil, nil}, fn char, {first, _} = acc ->
      case {is_digit?(char), first} do
        {false, _} -> acc
        {true, nil} -> {char, char}
        {true, first} -> {first, char}
      end
    end)
    |> to_num()
  end

  defp is_digit?(char) do
    case Integer.parse(char) do
      {_, _} -> true
      :error -> false
    end
  end

  defp to_num({first, last}) do
    {num, _} = Integer.parse(first <> last)
    num
  end
end
