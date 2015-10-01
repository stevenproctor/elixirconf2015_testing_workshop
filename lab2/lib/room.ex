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

  def leave(room, username) do
    ensure_user_in_room(room, username)
    do_leave_room(room, username)
  end

  def new_message(room, username, message) do
    ensure_user_in_room(room, username)
    do_add_new_message(room, username, message)
  end

  def messages_by_user(room, username) do
    ensure_user_in_room(room, username)
    do_find_messages_by_user(room, username)
  end

  defp ensure_user_in_room(room, username) do
    unless username in room.members do
      raise ArgumentError, message: "#{username} is not a member of the room" 
    end
  end

  defp do_leave_room(room, username) do
    %{room | members: List.delete(username, room.members)}
  end

  defp do_add_new_message(room, username, message) do
    %{room | messages: [%{user: username, message: message} | room.messages]}
  end

  defp do_find_messages_by_user(room, username) do
    for message <- room.messages,
                   message_is_from_user(message, username) do
      message.message
    end
  end

  defp message_is_from_user(%{user: username}, username), do: true
  defp message_is_from_user(%{}, username), do: false

end
