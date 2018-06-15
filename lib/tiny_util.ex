defmodule TinyUtil do
  @moduledoc """
  Documentation for TinyUtil.
  """

  @doc """
  Hello world.

  ## Examples

      iex> TinyUtil.hello
      :world

  """
  def hello do
    :world
  end

  defdelegate timeout(call_fn, opts \\ []), to: TinyUtil.Timeout
  defdelegate timeout!(call_fn, opts \\ []), to: TinyUtil.Timeout
end
