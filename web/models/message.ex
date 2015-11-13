defmodule PhxChat.Message do
  use PhxChat.Web, :model

  schema "messages" do
    field :content, :string
    field :room, :string
    field :user, :string

    timestamps
  end

  @required_fields ~w(content room user)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
