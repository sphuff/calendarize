# Calendarize

A tiny utility library that generates a calendar array given a Date or DateTime. Is helpful for quickly creating calendar views - you just need to add the view part.
All credit goes to the Javascript [calendarize](https://github.com/lukeed/calendarize) package.

## Installation

The package can be installed by adding `calendarize` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:calendarize, "~> 0.1.0"}
  ]
end
```

and installing with `mix deps.get`

## Documentation

Hosted at [https://hexdocs.pm/calendarize](https://hexdocs.pm/calendarize).

## Usage
```
iex> Calendarize.build(~D[2020-05-15])
[
  [0, 0, 0, 0, 0, 1, 2],
  [3, 4, 5, 6, 7, 8, 9],
  [10, 11, 12, 13, 14, 15, 16],
  [17, 18, 19, 20, 21, 22, 23],
  [24, 25, 26, 27, 28, 29, 30],
  [31, 0, 0, 0, 0, 0, 0]
]

iex> Calendarize.build(~D[2020-05-15], %{:week_start => :mon})
[
  [0, 0, 0, 0, 1, 2, 3],
  [4, 5, 6, 7, 8, 9, 10],
  [11, 12, 13, 14, 15, 16, 17],
  [18, 19, 20, 21, 22, 23, 24],
  [25, 26, 27, 28, 29, 30, 31],
  [0, 0, 0, 0, 0, 0, 0]
]
```

## License
MIT - [Stephen Huffnagle](https://sphuff.com)

