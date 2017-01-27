defmodule DiscussVue.Plugs.RequireAuth do
    import Plug.Conn
    import Phoenix.Controller

    alias DiscussVue.Router.Helpers

    def init(_params) do
    end

    def call(conn, _params) do
        if conn.assigns[:user] do
            conn
        else
            conn
            |> send_resp(401, "Not connected!")
            |> halt()
        end
    end
end