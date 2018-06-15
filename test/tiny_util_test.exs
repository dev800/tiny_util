defmodule TinyUtilTest do
  use ExUnit.Case
  doctest TinyUtil

  test "greets the world" do
    assert TinyUtil.hello() == :world
  end
end
