defmodule PhxChat.MessageTest do
  use PhxChat.ModelCase

  alias PhxChat.Message

  @valid_attrs %{content: "some content", room: "some content", user: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Message.changeset(%Message{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Message.changeset(%Message{}, @invalid_attrs)
    refute changeset.valid?
  end
end
