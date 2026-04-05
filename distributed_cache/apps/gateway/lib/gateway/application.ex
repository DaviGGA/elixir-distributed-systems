defmodule Gateway.Application do
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      DistributedCache.Gateway
    ]

    opts = [strategy: :one_for_one, name: Gateway.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
