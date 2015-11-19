defmodule PhxChat.ChatController do
  use PhxChat.Web, :controller

  def show(conn, _params) do
    render conn, "show.html", room: params[:room]
  end
end
