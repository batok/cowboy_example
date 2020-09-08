defmodule CowboyExample.Application do
  @moduledoc false
  require Logger

  use Application

  defp routes() do
    [
      {:_,
       [
         {"/", CowboyExample, []}
       ]}
    ]
  end

  def start(_type, _args) do
    dispatch = :cowboy_router.compile(routes())
    Logger.info("after routes")
    options =
      case System.get_env("USE_UNIX_SOCKETS") do
        "1" -> [port: 0, ip: {:local, "cowboy_example.sock"}]
        _ -> [port: 8080]
      end
    {:ok, _pid} = :cowboy.start_clear(:http, options, %{env: %{dispatch: dispatch}})
    Logger.info("after cowboy init")
    info = :ranch.info(:http)
    Logger.info("ranch:info/1 #{inspect info}")

    children = [
    ]

    opts = [strategy: :one_for_one, name: CowboyExample.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def stop(_) do
    :cowboy.stop_listener(:http)
  end
end
