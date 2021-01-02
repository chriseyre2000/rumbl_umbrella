defmodule RumblWeb.UserView do
  use RumblWeb, :view

  alias Rumbl.Accounts
  def first_name(%Accounts.User{name: name}) do
    name
      |> String.split(" ")
      |> hd()
  end

  def render("user.json", %{user: user}) do
    %{id: user.id, username: user.username}
  end

end
