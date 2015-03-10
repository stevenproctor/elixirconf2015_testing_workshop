defmodule Chat.Room do
  defstruct [:members, :messages]

  def new do
    %Chat.Room{members: [], messages: []}
  end

  def join(room, username) do
    if username in room.members do
      raise ArgumentError, message: "username already taken"
    else
      %{room | members: [username|room.members]}
    end
  end

  # Implement by user
  def leave(room, username) do
    if username in room.members do
      %{room | members: List.delete(room.members, username)}
    else
      raise ArgumentError, message: "user not in room"
    end
  end

  # Implement by user
  def new_message(room, username, message) do# , created_at) do
    message = %{user: username, text: message}# , created_at: created_at}
    %{room | messages: [message|room.messages]}
  end

  # Implement by user
  def messages_by_user(room, username) do
    for(%{user: user, text: message} <- room.messages,
        username == user,
        do: message)

    # |> Enum.sort(fn x, y -> x.created_at > y.created_at end)
  end
end

# 1. Add a timestamp to message and sort by created_at
# 2. Filter by username in messages_by_user (create whole function based on API)
# 3. Add admins and the ability to block user
