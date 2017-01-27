defmodule DiscussVue.AuthController do
    use DiscussVue.Web, :controller
    plug Ueberauth

    alias DiscussVue.User

    def callback(%{assigns: %{ueberauth_auth: auth}} = conn, params) do
        user_params = %{token: auth.credentials.token, email: auth.info.email, provider: "github"}
        changeset = User.changeset(%User{}, user_params)

        signin(conn, changeset)
    end

    defp signin(conn, changeset) do
        case insert_or_update_user(changeset) do
            {:ok, user} ->
                conn
                |> put_session(:user_id, user.id)            
                |> redirect(to: "/#/login?email=#{user.email}&id=#{user.id}")
            {:error, _reason} ->
                conn
                |> redirect(to: "/#/login?failed=1")
        end
    end

    defp insert_or_update_user(changeset) do
        case Repo.get_by(User, email: changeset.changes.email) do
            nil ->
                Repo.insert(changeset)
            user ->
                {:ok, user}
        end
    end

    def signout(conn, _params) do
        conn
        |> configure_session(drop: true)
        |> redirect(to: "/#/logout")
    end

    def get_user_id(conn, _params) do
        json conn, %{"user_id" => conn.assigns[:user] && conn.assigns[:user].id}
    end
end