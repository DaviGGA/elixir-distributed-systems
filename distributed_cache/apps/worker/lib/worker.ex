defmodule Worker do
  use GenServer

  def start_link(_arg) do
    GenServer.start_link(__MODULE__, %{}, name: __MODULE__)
  end

  def local_get(key) do
    GenServer.call(__MODULE__, {:local_get, key})
  end

  def local_set(key, data) do
    GenServer.call(__MODULE__, {:local_set, key, data})
  end

  def handle_call({:local_get, key}, _from, state) do
    {:reply, Map.get(state), state}
  end

  def handle_call({:local_set, key, data}, _from, state) do
    {:noreply, Map.put(state)}
  end

end
