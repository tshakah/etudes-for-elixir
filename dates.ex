defmodule Dates do
  def date_parts(date) do
    String.split(date, ~r([-.\s\/]))
    |> Enum.map(&String.to_integer &1)
  end
end
