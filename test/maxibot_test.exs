defmodule MaxibotTest do
  use ExUnit.Case
  doctest Maxibot

  test "greets the world" do
    assert Maxibot.hello() == :world
  end
end
