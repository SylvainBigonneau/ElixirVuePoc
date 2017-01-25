defmodule DiscussVue.TopicController do
    use DiscussVue.Web, :controller

    alias DiscussVue.Topic
    alias DiscussVue.User

    # plug DiscussVue.Plugs.RequireAuth when action in [:create, :update, :delete]
    # plug :check_topic_owner when action in [:update, :delete]

    def index(conn, _params) do
        topics = Repo.all(Topic)

        json conn, topics
    end

    def show(conn, %{"id" => topic_id}) do
        topic = Repo.get!(Topic, topic_id)
        json conn, topic
    end

    def create(conn, %{"topic" => topic}) do
        changeset = Repo.get(User, 1)
        |> build_assoc(:topics)
        |> Topic.changeset(topic)

        case Repo.insert(changeset) do
            {:ok, _post} ->
                conn
                |> json(topic)
            {:error, _changeset} ->
                conn
                |> send_resp(500, %{"message" => "error creating", "topic" => topic})
        end
    end

    def update(conn, %{"id" => topic_id, "topic" => topic}) do
        old_topic = Repo.get(Topic, topic_id)
        changeset = Topic.changeset(old_topic, topic)

        case Repo.update(changeset) do
            {:ok, _topic} ->
                conn
                |> json(topic)
            {:error, _changeset} ->
                conn
                |> send_resp(500, %{"message" => "error updating", "topic" => topic})
        end
    end

    def delete(conn, %{"id" => topic_id}) do
        Repo.get!(Topic, topic_id) |> Repo.delete!

        conn
        |> json("OK")
    end

    def check_topic_owner(conn, _params) do
        %{params: %{"id" => topic_id}} = conn

        if Repo.get(Topic, topic_id).user_id == conn.assigns.user.id do
            conn
        else
            conn
            |> send_resp(500, %{"message" => "You cannot edit that", "topic_id" => topic_id})
            |> halt()
        end
    end
end