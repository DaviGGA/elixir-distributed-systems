defmodule DistributedCacheTest do
  use ExUnit.Case
  doctest DistributedCache

  test "greets the world" do
    assert DistributedCache.hello() == :world
  end
end
