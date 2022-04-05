defmodule Maxi.Consumer do

  use Nostrum.Consumer
  alias Nostrum.Api

  def start_link do
    Consumer.start_link(__MODULE__)
  end

  def handle_event({:MESSAGE_CREATE, msg, _ws_state}) do
    if msg.author.username == "lunaジュ" do
      handle_mom(msg)
    else
      handle_others(msg)
    end
  end

  def handle_event(_event) do
    :noop
  end

  def handle_mom(msg) do
    case msg.content do
      ">hello" -> Api.create_message(msg.channel_id, "HI MOM! I LOVE YOU!!")
      _ -> :ignore
    end
  end

  def handle_others(msg) do
    case msg.content do
      ">hello" -> Api.create_message(msg.channel_id, "HI!")
      ">tst" -> IO.puts(msg)
      _ -> :ignore
    end
  end


end
