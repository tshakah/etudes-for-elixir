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

  @doc """
  Calculate julian date from an ISO string (YYYY-MM-DD)
  """

  @spec julian(String.t) :: integer
  def julian(date) do
    [year, months, days] = date_parts(date)

    [31, feb_days(year), 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    |> month_total(months - 1) |> + days
  end

  @spec feb_days(String.t) :: integer
  defp feb_days(year) do
    if is_leap_year(year), do: 29, else: 28
  end

  @spec is_leap_year(String.t) :: boolean
  defp is_leap_year(year) do
    (rem(year,4) == 0 and rem(year,100) != 0)
    or (rem(year, 400) == 0)
  end

  @spec month_total(integer, [integer], integer) :: integer
  defp month_total(result \\ 0, month_list, months) do
    case [months, month_list] do
      [0, _] -> result
      [_, [head | tail]] -> result + head |> month_total(tail, months - 1)
    end
  end
end
