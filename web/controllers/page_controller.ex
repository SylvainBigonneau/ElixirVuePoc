defmodule DiscussVue.PageController do
  use DiscussVue.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
