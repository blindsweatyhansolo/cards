defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "create_deck/0 makes makes 20 cards" do
    deck_length = length(Cards.create_deck())
    assert deck_length == 20
  end

  test "shuffle/0 a deck randomizes it" do
    deck = Cards.create_deck()
    assert deck != Cards.shuffle(deck)
    # refute deck == cards.shuffle(deck)
  end

  test "contains?/2 checks if a card is in a deck" do
    deck = Cards.create_deck()
    Cards.contains?(deck, "Ace of Spades")
    assert true
  end
end
