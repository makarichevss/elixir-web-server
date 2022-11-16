defmodule HttpServer.Router do
  use Plug.Router

  plug :match
  plug :dispatch

  get "/" do
    send_resp(conn, 200, "Welcome to my API")
  end

  get "/:name" do
    send_resp(conn, 200, "Welcome #{name}")
  end

  match _ do
    send_resp(conn, 404, "No route for your call")
  end

end
