# defmodule Recurse do
#   def my_map([head | tail], func) do
#     [func.(head) | my_map(tail, func)]
#   end

#   def my_map([], _func), do: []
# end

# =================================================================================================================================================

# ranks = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"]

# suits = ["♣", "♦", "♥", "♠"]

# deck =
#   for rank <- ranks,
#       suit <- suits,
#       do: {rank, suit}

# deck
# |> Enum.shuffle()
# |> Enum.take(13)
# |> IO.inspect()
