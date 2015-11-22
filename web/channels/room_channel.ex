defmodule PhxChat.RoomChannel do
  use Phoenix.Channel
  alias PhxChat.Repo
  alias PhxChat.Message

  def join("rooms:lobby", _message, socket) do
    {:ok, socket}
  end

  def join("rooms:" <> _private_room_id, _params, _socket) do
    {:error, %{reason: "unauthorized"}}
  end

  def handle_in("new_msg", %{"body" => body}, socket) do
    sender = socket.assigns.username
    changeset = Message.changeset(%Message{}, %{"content" => body, "room" => socket.topic, "user" => sender})

    case Repo.insert(changeset) do
      {:ok, _message} ->
        broadcast! socket, "new_msg", %{body: body, sender: sender}
        {:noreply, socket}
    end
  end

  def handle_out("new_msg", payload, socket) do
    push socket, "new_msg", payload
    {:noreply, socket}
  end
end
