defmodule ElixirWebServer.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false
  require Logger
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: ElixirWebServer.Worker.start_link(arg)
      # {ElixirWebServer.Worker, arg}
      {Plug.Cowboy, scheme: :http, plug: HttpServer.HelloWord.Plug, options:
        [port: 8000]},
      {Plug.Cowboy, scheme: :http, plug: HttpServer.Router, options: [port: 7000]}
    ]
    Logger.info("Running the web servers...")
    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ElixirWebServer.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
