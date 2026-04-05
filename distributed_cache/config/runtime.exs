import Config

role =
  System.get_env("NODE_ROLE")
  |> case do
    "gateway" -> :gateway
    "worker" -> :worker
    _ -> :worker
  end

config :distributed_cache, :role, role
