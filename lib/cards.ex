defmodule Cards do
  @moduledoc """
    Provides methods for creating and handling a deck of cards
  """

  @doc """
    Returns a list of strings representing a deck of playing cards
  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    # create new list that contains every combination between values and suits
    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  @doc """
    Takes the list of strings (deck), and shuffles their order using the `Enum.shuffle/1` method
  """
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
    Uses the `Enum.member?/2` method to check if a specific card is in the deck. Returns a boolean.
  """
  def contains?(deck, card) do
    # first arg = enumerable, second arg = what to find
    Enum.member?(deck, card)
  end

  @doc """
    Divides a deck into a hand and the remainder of the deck.
    The `hand_size` argument indicates how many cards should be in the hand.

  ## Examples

        iex> deck = Cards.create_deck
        iex> {hand, deck} = Cards.deal(deck, 1)
        iex> hand
        ["Ace of Spades"]
  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  @doc """
    Save a deck to the filesystem. Takes the deck and the desired filename and uses the erlang
    built-in function term_to_binary to convert the strings (deck) to binary. New encoded deck is passed to `write`
    method with desired filename.
  """
  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  @doc """
    Load previously saved file off disk, uses erlang built in function binary_to_term to translate
    into something readable. Case matching on status from `File.read/1` to handle argument errors.
  """
  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term binary
      {:error, _reason} -> "That file does not exist!"
    end
  end

  @doc """
    All in one method: creates deck, shuffles it, and deals deck into a hand (`hand_size` argument indicates how many cards should be in the hand).
  """
  def create_hand(hand_size) do
    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end

end
