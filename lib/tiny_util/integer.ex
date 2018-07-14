defmodule TinyUtil.Integer do
  def parse(nil), do: 0
  def parse(x) when is_integer(x), do: x

  def parse(x) when is_float(x) do
    x |> :erlang.float_to_binary(decimals: 2) |> parse
  end

  def parse(x) when is_binary(x) or is_bitstring(x) do
    try do
      case x |> String.trim() |> Integer.parse() do
        {i, _} -> i
        :error -> 0
      end
    rescue
      ArgumentError -> 0
    end
  end

  def parse(x) when is_atom(x) do
    try do
      x |> Atom.to_string() |> parse
    rescue
      ArgumentError -> 0
    end
  end

  require Integer

  def with_alternate(list, opts \\ []) do
    even_item = opts[:even] || 2
    odd_item = opts[:odd] || 1

    list
    |> Enum.with_index(1)
    |> Enum.map(fn {item, index} ->
      {item, if(Integer.is_even(index), do: even_item, else: odd_item)}
    end)
  end
end
