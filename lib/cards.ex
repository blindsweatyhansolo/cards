# SEE notes.md FOR ELIXIR NOTES!
defmodule Cards do
  # create list of playing cards
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    # create new list that contains every combination between values and suits
    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  # pass in deck variable, shuffle them
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  # check if a deck contains a specific card
  def contains?(deck, card) do
    # first arg = enumerable, second arg = what to find
    Enum.member?(deck, card)
  end

  # deal out a set of cards
  def deal(deck, hand_size) do
    # first arg = enumerable, second arg = count
    # takes deck and splits it by hand_size arg, returns tuple
    Enum.split(deck, hand_size)
  end

  # save a deck to the fs, pass in deck and filename
  def save(deck, filename) do
    # (encode) turn the deck arg into an object that can be saved to the file system
    binary = :erlang.term_to_binary(deck)
    # pass new encoded deck to write method, with filename to be saved as
    File.write(filename, binary)
  end

end
