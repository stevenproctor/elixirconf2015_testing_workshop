defmodule Chat.RoomTest do
  use ExUnit.Case
  use ShouldI
  import ShouldI.Matchers.Context
  alias Chat.Room

  with "empty room" do
    setup context do
      assign context, room: Room.new
    end

    should_match_key room: %Room{messages: [], members: []}

    with "member bob" do
      setup context do
        assign context, room: Room.join(context.room, "bob")
      end

      should "not be able to join twice", context do
        assert_raise ArgumentError, "username already taken", fn ->
          Room.join(context.room, "bob")
        end
      end

      # Implement by user
      should "be able to join room", context do
        room = Room.join(context.room, "jane")
        assert "jane" in room.members
      end

      # Implement by user
      should "not be able to leave if not already joined", context do
        assert_raise ArgumentError, "user not in room", fn ->
          Room.leave(context.room, "jane")
        end
      end

      # Implement by user
      should "be able to leave room", context do
        room = Room.leave(context.room, "bob")
        refute "bob" in room.members
      end
    end

    with "members bob, jane and two messages" do
      # Implement by group
      setup context do
        room = context.room
               |> Room.join("bob")
               |> Room.join("jane")
               |> Room.new_message("bob", "Hi there Jane!")
               |> Room.new_message("jane", "Bob, how are you?")

        assign context, room: room
      end

      # Implement by group
      should_match_key room: %Room{members: ["jane", "bob"]}

      # Implement by group
      should "filter messages based on user", context do
        assert Room.messages_by_user(context.room, "no one") == []
        assert Room.messages_by_user(context.room, "bob") == ["Hi there Jane!"]
      end
    end
  end
end
