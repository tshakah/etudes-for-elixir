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

  @spec area(atom(), number(), number()) :: number()

  def area(shape, a, b) when a >= 0 and b >= 0 do
    case shape do
      :rectangle -> a * b
      :triangle -> a * b  / 2.0
      :ellipse -> :math.pi * a * b
    end
  end
end

