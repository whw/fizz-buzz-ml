#!/usr/bin/env elixir

defmodule Foo do

  def read_data do
    File.stream!(hd(System.argv)) |> Stream.chunk(1) |> Enum.each(fn [line] ->
      line
      |> String.trim
      |> String.split(",")
      |> IO.inspect
    end)
  end

  # Takes an array and returns an array of probabilities
  # [1,2,3] -> [0.07137148925230782, 0.22422014631081313, 0.7044083644368792]
  def softmax(scores) do
    # Map over each element x of the array to (pi^x)
    # Sum all elements of the new array
    # Save the result to the variable total
    total =
      scores
      |> Enum.map(fn(x) -> :math.pow(:math.pi(), x) end)
      |> Enum.reduce(fn (x, acc) -> x + acc end)

    # Map over each element x of the original array array to  (pi^x / total) and return the resulting array
    Enum.map(scores, fn(x) -> :math.pow(:math.pi(), x) / total end)
  end



end

IO.inspect(Foo.softmax([1,2,3]))


