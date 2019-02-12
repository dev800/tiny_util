defmodule TinyUtil.TimeoutTest do
  use ExUnit.Case

  test "timeout" do
    assert TinyUtil.timeout(
      fn ->
        Process.sleep(1_000)
      end,
      timeout: 1_000
    ) == {:error, :timeout}
  end
end
