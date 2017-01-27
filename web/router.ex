defmodule DiscussVue.Router do
  use DiscussVue.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :fetch_session
    plug :accepts, ["json"]
    plug DiscussVue.Plugs.SetUser
  end

  scope "/", DiscussVue do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/api", DiscussVue do
    pipe_through :api # Use the default browser stack

    get "/getUserId", AuthController, :get_user_id
    resources "/topics", TopicController
  end

  scope "/auth", DiscussVue do
    pipe_through :browser

    get "/signout", AuthController, :signout
    get "/:provider", AuthController, :request
    get "/:provider/callback", AuthController, :callback
  end


  # Other scopes may use custom stacks.
  # scope "/api", DiscussVue do
  #   pipe_through :api
  # end
end
