defmodule AdventOfCode2023.Day1.Problem2 do
  @moduledoc """
  Your calculation isn't quite right. It looks like some of the digits are
  actually spelled out with letters: one, two, three, four, five, six, seven,
  eight, and nine also count as valid "digits".

  Equipped with this new information, you now need to find the real first and
  last digit on each line. For example:

      two1nine
      eighthree
      abcone2threexyz
      xtwone3four
      4nineeightseven2
      zoneight234
      7pqrstsixteen

  In this example, the calibration values are 29, 83, 13, 24, 42, 14, and 76.
  Adding these together produces 281.

  What is the sum of all of the calibration values?
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
    |> get_digits()
    |> to_num()
  end

  defp get_digits(line, digits \\ [])
  defp get_digits("", digits), do: Enum.reverse(digits)
  defp get_digits("one" <> _ = line, digits), do: get_digits(trim(line), ["1" | digits])
  defp get_digits("two" <> _ = line, digits), do: get_digits(trim(line), ["2" | digits])
  defp get_digits("three" <> _ = line, digits), do: get_digits(trim(line), ["3" | digits])
  defp get_digits("four" <> _ = line, digits), do: get_digits(trim(line), ["4" | digits])
  defp get_digits("five" <> _ = line, digits), do: get_digits(trim(line), ["5" | digits])
  defp get_digits("six" <> _ = line, digits), do: get_digits(trim(line), ["6" | digits])
  defp get_digits("seven" <> _ = line, digits), do: get_digits(trim(line), ["7" | digits])
  defp get_digits("eight" <> _ = line, digits), do: get_digits(trim(line), ["8" | digits])
  defp get_digits("nine" <> _ = line, digits), do: get_digits(trim(line), ["9" | digits])

  defp get_digits(line, digits) do
    {first, line} = String.split_at(line, 1)

    if is_digit?(first) do
      get_digits(line, [first | digits])
    else
      get_digits(line, digits)
    end
  end

  defp trim(line) do
    {_, line} = String.split_at(line, 1)
    line
  end

  defp is_digit?(char) do
    case Integer.parse(char) do
      {_, _} -> true
      :error -> false
    end
  end

  defp to_num([digit]) do
    {num, _} = Integer.parse(digit <> digit)
    num
  end

  defp to_num([first | digits]) do
    last = List.last(digits)
    {num, _} = Integer.parse(first <> last)
    num
  end
end
