defmodule TinyUtil.Timeout do
  @moduledoc """
  * opts
    - :timeout
  """

  @default_timeout 5_000

  @doc """
  超时操作

  ## call_fn

    成功的回调
  
  ## opts

  * `:timeout` 超时的时间，默认为#{@default_timeout}毫秒

  ## Examples

      iex> TinyUtil.timeout(fn -> Process.sleep(1_000) end, timeout: 1_000)
  """
  def timeout(call_fn, opts \\ []) do
    try do
      result =
        call_fn
        |> Task.async()
        |> Task.await(opts[:timeout] || @default_timeout)

      {:ok, result}
    catch
      :exit, _ -> {:error, :timeout}
    end
  end

  def timeout!(call_fn, opts \\ []) do
    call_fn
    |> timeout(opts)
    |> case do
      {:ok, result} ->
        result

      {:error, :timeout} ->
        raise TinyUtil.TimeoutError, message: "TinyUtil Timeout"
    end
  end
end
