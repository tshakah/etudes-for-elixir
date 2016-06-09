defmodule Dates do
  @moduledoc """
  Functions for working with dates and date strings.
  """

  @doc """
  Takes a string in ISO8601 format YYYY-MM-DD, and gives back an
  array [YYYY, MM, DD]
  """

  @spec date_parts(String.t) :: list
  def date_parts(date) do
    String.split(date, ~r([-.\s\/]))
    |> Enum.map(&String.to_integer &1)
  end
end
