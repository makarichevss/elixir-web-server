defmodule ElixirWebServerTest do
  use ExUnit.Case
  doctest ElixirWebServer

  test "greets the world" do
    assert ElixirWebServer.hello() == :world
  end
end
