defmodule AskArea do
  @moduledoc """
  Validating input for the Geom module.
  """

  @spec area() :: number
  def area() do
    get_shape()
    |> case do
      {:ok, shape} -> get_numbers(shape)
      {:error, reason} -> IO.puts reason
    end
  end

  @spec get_shape() :: {:ok, atom} | {:error, String.t}
  defp get_shape() do
    IO.gets("[R]ectangle, [T]riangle or [E]llipse: ") |> tidy |> String.first
    |> case do
      "R" -> {:ok, :rectangle}
      "T" -> {:ok, :triangle}
      "E" -> {:ok, :ellipse}
      unknown -> {:error, "Unknown shape: #{unknown}"}
    end
  end

  @spec get_numbers(atom) :: number
  defp get_numbers(shape) do
    {width, _} = IO.gets("Enter width: ") |> tidy |> Float.parse
    {height, _} = IO.gets("Enter height: ") |> tidy |> Float.parse
    Geom.area(shape, width, height)
  end

  @spec tidy(String.t) :: String.t
  defp tidy(input) do
    String.strip(input)
    |> String.upcase
  end
end
