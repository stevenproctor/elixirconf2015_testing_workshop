defmodule Chat.Room2 do
  defstruct [:id]

  def join(repo, room, user) do
    Chat.Repo.save(repo, %{user | room_id: room.id})
  end

  def leave(repo, user) do
    Chat.Repo.save(repo, %{user | room_id: nil})
  end

  def members(repo, room) do
    users = Chat.Repo.all(repo, Chat.User)

    for(user <- users,
        user.room_id == room.id,
        do: user)
  end
end
