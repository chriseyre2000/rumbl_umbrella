defmodule RumblWeb.UserSocket do
  use Phoenix.Socket

  ## Channels
  channel "videos:*", RumblWeb.VideoChannel

  @max_age 2 * 7 * 60 * 60

  @impl true
  def connect(%{"token" => token}, socket) do
    case Phoenix.Token.verify(
      socket,
      "user socket",
      token,
      max_age: @max_age
    ) do
      {:ok, user_id} ->
        {:ok, assign(socket, :user_id, user_id)}
      {:error, _reason} ->
        :error
    end
  end

  def connect(_params, _socket), do: :error

  @impl true
  def id(socket), do: "users_socket:#{socket.assigns.user_id}"
end
