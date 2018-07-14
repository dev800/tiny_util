defmodule TinyUtil.Timeout do
  @moduledoc """
  * opts
    - :timeout
  """

  def timeout(call_fn, opts \\ []) do
    try do
      result =
        call_fn
        |> Task.async()
        |> Task.await(opts[:timeout] || 5_000)

      {:ok, result}
    catch
      :exit, _ -> {:error, :timeout}
    end
  end

  def timeout!(call_fn, opts \\ []) do
    case timeout(call_fn, opts) do
      {:ok, result} ->
        result

      {:error, :timeout} ->
        raise TinyUtil.TimeoutError, message: "TinyUtil.Timeout"
    end
  end
end
