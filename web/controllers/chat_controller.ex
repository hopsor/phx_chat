defmodule PhxChat.ChatController do
  use PhxChat.Web, :controller

  def show(conn, params) do
    render conn, "show.html", room: params["join"]["room"], username: params["join"]["username"]
  end
end
