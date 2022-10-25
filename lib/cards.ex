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
    # (encode) turn the deck arg into an object that can be saved to the file
    # system as a tuple of binary
    binary = :erlang.term_to_binary(deck)
    # pass new encoded deck to write method, with filename to be saved as
    File.write(filename, binary)
  end

  # load file off disk, uses Erlang to translate into something readable
  def load(filename) do
    # ERROR HANDLING: if status from File.read = :ok execute reverse action from save
    # method, will change saved deck to a readable list of strings, if :error
    # display error message (catches all non matching args)
    case File.read(filename) do
      # PATTERN MATCHING: arg1 comparison (:ok/:error), arg2 assignment (binary, _reason)
      {:ok, binary} -> :erlang.binary_to_term binary
      {:error, _reason} -> "That file does not exist!"
    end
  end

end
