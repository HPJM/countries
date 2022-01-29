# Countries

Useful functions for all ISO 3166-2 country codes and names in Elixir.

[Data source](https://datahub.io/core/country-list)

## Examples

```elixir
defmodule MyModule do
  use Countries

  def check_code(code) do
    if valid_code?(code) do
      {:ok, code}
    else
      {:error, {:invalid, code}}
    end
  end

  def country_info(code) do
    with {:ok, code} <- check_code(code) do
      {:ok, code, from_code(code)}
    end
  end
end
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `countries` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:countries, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/countries](https://hexdocs.pm/countries).

