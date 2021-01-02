defmodule Rumbl.TestHelpers do
  alias Rumbl.{Accounts, Multimedia}


  @spec user_fixture(nil | maybe_improper_list | map) :: any
  def user_fixture(attrs \\ %{}) do
    username = "username#{:random.uniform(1000)}"
    {:ok, user} =
      attrs
      |> Enum.into(%{
        name: "Some User",
        username: username,
        credential: %{
          email: attrs[:email] || "#{username}@example.com",
          password: attrs[:password] || "supersecret",
        }
      })
      |> Accounts.register_user()
      user
  end

  def video_fixture(%Accounts.User{} = user, attrs \\ %{}) do
    attrs =
      Enum.into(attrs, %{
        title: "A Title",
        url: "http://example.com",
        description: "a description"
      })
    {:ok, video} = Multimedia.create_video(user, attrs)
    video
  end
end
