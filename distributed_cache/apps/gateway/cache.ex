defmodule DistributedCache.Gateway do
  use GenServer

  def start_link(_arg) do
    IO.puts("Starting gateway")
    GenServer.start_link(__MODULE__, _arg, name: __MODULE__)
  end

  def get(key) do
    GenServer.call(__MODULE__, {:get, key})
  end

  def set(key, data) do
    GenServer.call(__MODULE__, {:set, key, data})
  end

  def handle_call({:get, key}, _from, state) do
    data = :ok
    {:reply, data, state}
  end

  def handle_call({:set,key, data}, _from, state) do
    {:noreply, state}
  end
end
