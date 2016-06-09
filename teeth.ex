defmodule Teeth do
  @moduledoc """
  Of course, we are now working with teeth. This module deals with
  a list of lists representing tooth pockets.
  """

  @doc """
  Teeth need attention when the pocket >= 4mm - take a list of pockets
  around the teeth and alert us if any need attention
  """

  @spec alert([list]) :: [integer]
  def alert(depths) do
    depths
    |> Stream.with_index
    |> Stream.map(
      fn({x, y}) -> if Stats.maximum(x) >= 4, do: y + 1 end)
    |> Enum.reject(&(&1 == nil))
  end

  @spec pocket_depths() :: [list]
  def pocket_depths do
    [[0], [2,2,1,2,2,1], [3,1,2,3,2,3],
    [3,1,3,2,1,2], [3,2,3,2,2,1], [2,3,1,2,1,1],
    [3,1,3,2,3,2], [3,3,2,1,3,1], [4,3,3,2,3,3],
    [3,1,1,3,2,2], [4,3,4,3,2,3], [2,3,1,3,2,2],
    [1,2,1,1,3,2], [1,2,2,3,2,3], [1,3,2,1,3,3], [0],
    [3,2,3,1,1,2], [2,2,1,1,3,2], [2,1,1,1,1,2],
    [3,3,2,1,1,3], [3,1,3,2,3,2], [3,3,1,2,3,3],
    [1,2,2,3,3,3], [2,2,3,2,3,3], [2,2,2,4,3,4],
    [3,4,3,3,3,4], [1,1,2,3,1,2], [2,2,3,2,1,3],
    [3,4,2,4,4,3], [3,3,2,1,2,3], [2,2,2,2,3,3],
    [3,2,3,2,3,2]]
  end
end
