# Calendarize

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `calendarize` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:calendarize, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/calendarize](https://hexdocs.pm/calendarize).

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

