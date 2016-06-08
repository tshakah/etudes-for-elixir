defmodule Geom do
  @moduledoc """
  Functions for calculating areas of geometric shapes.
  """

  @doc """
  Calculates the area of a shape, given the shape and two
  dimensions. Returns the product of its arguments for a
  rectangle, one half the product of the arguments for a
  triangle, and :math.pi times the product of the arguments
  for an ellipse. Accepts only positive dimensions.
  """

  @spec area(atom, number, number) :: number

  def area(shape, x, y) when x > 0.0 and y > 0.0 do
    case shape do
      :rectangle -> x * y
      :triangle -> x * y  / 2.0
      :ellipse -> :math.pi * x * y
    end
  end

  def area(_, _, _) do
    IO.puts("Both numbers must be greater than zero.")
  end
end

