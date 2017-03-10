defmodule Chat.UserChannel do
  use Phoenix.Channel
  require Logger

  def join("user:lobby", nickname, socket) do
    Process.flag(:trap_exit, true)
    :timer.send_interval(3000, :ping)
    send(self(), {:after_join, nickname})
    {:ok, socket}
  end

  def handle_info({:after_join, nickname}, socket) do
    Presence.track(socket, socket.assigns.nickname, %{
      online_at: :os.system_time(:milli_seconds)
    })
    push socket, "presence_state", Presence.list(socket)
    {:noreply, socket}
  end

  def handle_info(:ping, socket) do
    push socket, "new:msg", %{user: "SYSTEM", body: "ping"}
    {:noreply, socket}
  end

  def terminate(reason, _socket) do
    Logger.debug"> leave #{inspect reason}"
    :ok
  end

  def handle_in("new:msg", msg, socket) do
    broadcast! socket, "new:msg", %{user: msg["user"], body: msg["body"]}
    {:reply, {:ok, %{msg: msg["body"]}}, assign(socket, :user, msg["user"])}
  end
end