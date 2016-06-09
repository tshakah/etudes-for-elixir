defmodule Stats do
  @moduledoc """
  Basic statistics functions
  """

  @spec minimum([number]) :: number
  def minimum(list) do
    [head | tail] = list
    calc(:min, head, tail)
  end

  @spec maximum([number]) :: number
  def maximum(list) do
    [head | tail] = list
    calc(:max, head, tail)
  end

  @spec range([number]) :: [number]
  def range(list) do
    [minimum(list), maximum(list)]
  end

  @spec calc(number, atom, [number] | []) :: number
  defp calc(method, result, list) do
    case [method, list]  do
      [:min, [head | tail]] when head < result -> calc(method, head, tail)
      [:max, [head | tail]] when head > result -> calc(method, head, tail)
      [_, [_ | tail]] -> calc(method, result, tail)
      [_, []] -> result
    end
  end
end
