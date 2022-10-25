# MIX AND IEX
```> iex ```

interactive elixir shell, run in command line

```> iex -S mix ```

using **mix**, auto compiles and makes project avail within iex shell (must be in working directory)

```> recompile ``` OR ```> r <module name> ```

recompile code after making changes


## Built in Methods from Standard Library
[**Enum**](https://hexdocs.pm/elixir/Enum.html): working with lists of data

[**List**](https://hexdocs.pm/elixir/List.html): working with linked lists

## Key Notes
- NO INSTANCE VARIABLES / NO CLASSES (vs OOP)
    - All data within an application are data structures made out of primitive variables that represent the absolute bare essence of the data that is being worked with
    - Whenever taking action on a piece of data, the data is passed into a method which processes it and then returns some result
- **Implicit returns** - *return* keyword not needed in functions, automatically returns the last value within a method/function
- **DOUBLE QUOTES** is the convention in elixir code
- methods with a **?** return a **Boolean** value
- Elixir code gets transpiled into **Erlang**, which then gets compiled and executed on the **BEAM** (B/B... Erlang Abstract Machine, VM in which all Erlang code is executed)


## Glossary
**arity** - number of args a function accepts
```
shuffle/1 -> Cards.shuffle() takes one (1) arg
```

**modules** - collection of methods / functions
```
defmodule Cards
```

**list comprehension** - mapping function, like Elixir's version of a *for loop*. Multiple comprehensions can run at the same time.
```
for suit <- suits, value <- values do
    "#{value} of #{suit}"
end

For every element in suits AND every element in values, execute code in do block. Whatever is returned gets put into a new list. In this case, a list of each value with each suit is returned as its own string, ex: "Ace of Spades".
```

**tuple** - like a list where each index has a special meaning, surrounded by *curly brackets { }*

**pattern matching** - Elixir's replacement for variable assignment, uses the *=* symbol. 