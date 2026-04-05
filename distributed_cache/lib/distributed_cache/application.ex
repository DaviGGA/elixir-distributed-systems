defmodule DistributedCache.Application do
  use Application

  @impl true
  def start(_type, _args) do
    role = Application.get_env(:distributed_cache, :role)

    children =
      case role do
        :gateway -> gateway_children()
        :worker -> worker_children()
      end

    opts = [strategy: :one_for_one, name: DistributedCache.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def gateway_children() do
    [
      DistributedCache.Gateway
    ]
  end
end
