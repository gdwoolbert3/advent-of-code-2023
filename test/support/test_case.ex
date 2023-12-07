defmodule AdventOfCode2023.TestCase do
  @moduledoc """
  This module defines the setup for this application's tests.
  """

  use ExUnit.CaseTemplate

  @application :advent_of_code_2023

  using do
    quote do
      import AdventOfCode2023.TestCase
    end
  end

  ################################
  # Public API
  ################################

  @doc """
  Streams the input file for the given day and problem.
  """
  @spec stream_input(pos_integer(), pos_integer(), keyword()) :: Enumerable.t()
  def stream_input(day, problem \\ 1, opts \\ []) do
    ext = Keyword.get(opts, :ext, "txt")
    path = "/day_#{day}/problem_#{problem}_input.#{ext}"

    @application
    |> :code.priv_dir()
    |> to_string()
    |> Kernel.<>(path)
    |> File.stream!()
  end
end
