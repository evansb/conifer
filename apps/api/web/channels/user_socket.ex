defmodule Api.UserSocket do
  use Phoenix.Socket

  channel "user:*", Chat.UserChannel

  transport :websocket, Phoenix.Transports.WebSocket
  transport :longpoll, Phoenix.Transports.LongPoll

  def connect(%{"nickname" => nickname}, socket) do
    {:ok, assign(socket, :nickname, nickname)} 
  end

  def id(_socket), do: nil
end