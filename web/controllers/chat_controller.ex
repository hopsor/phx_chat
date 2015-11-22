defmodule PhxChat.ChatController do
  use PhxChat.Web, :controller
  import Ecto.Query
  alias PhxChat.Repo
  alias PhxChat.Message

  def show(conn, params) do
    room = params["join"]["room"]
    query = from m in Message,
      where: ilike(m.room, "rooms:" <> room),
      order_by: m.inserted_at,
      select: m
    messages = Repo.all(query)
    render conn, "show.html", room: room, username: params["join"]["username"], messages: messages
  end
end
