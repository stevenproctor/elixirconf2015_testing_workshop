defmodule Chat.Message do
  defstruct [:id, :room_id, :user_id, :text, :created_at]
  alias Chat.Repo
  alias Chat.Message

  def messages_in_room(repo, room) do
    messages = Repo.all(repo, Message)

    for %Message{room_id: room_id, text: text} <- messages,
        room_id == room.id,
        do: text
  end
end
