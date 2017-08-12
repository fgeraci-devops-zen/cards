defmodule Cards do
  @moduledoc """
    Provides methods for creating and handling a deck of cards
  """

  def create_deck do
   values = ["Ace", "Two", "Three", "Four", "Five"]
   suits = ["Spades", "Clubs", "Hearts", "Diamonds"]
   
    for suit <- suits, value <- values do
        "#{value} of #{suit}"
    end
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def contains?(deck, card) do
    Enum.member?(deck, card)    
  end

  def deal(deck, hand_size) do # separating a single list in 2 different lists - get a tuple of lists
    Enum.split(deck, hand_size)
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term binary
      {:error, _reason} -> "Sure you wrote the right filename, uhm?"
    end
  end
  def create_hand(hand_size) do
    _deck = Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end
end

