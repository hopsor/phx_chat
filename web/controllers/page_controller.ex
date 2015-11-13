defmodule PhxChat.PageController do
  use PhxChat.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
