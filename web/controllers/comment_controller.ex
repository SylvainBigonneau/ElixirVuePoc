defmodule DiscussVue.CommentController do
    use DiscussVue.Web, :controller

    alias DiscussVue.Topic
    alias DiscussVue.Comment

    plug DiscussVue.Plugs.RequireAuth when action in [:create, :update, :delete]
    plug :check_topic_owner when action in [:update, :delete]

    def index(conn, %{"topic_id" => topic_id}) do
        comments = Repo.all(Comment, topic_id: topic_id) |> Repo.preload(:user)

        json conn, comments
    end

    def show(conn, %{"topic_id" => topic_id, "id" => comment_id}) do
        comment = Repo.get!(Comment, topic_id: topic_id, id: comment_id) |> Repo.preload(:user)

        json conn, comment
    end

    def create(conn, %{"topic_id" => topic_id, "comment" => comment}) do
        changeset = Repo.get(Topic, topic_id)
        |> build_assoc(:comments, user_id: conn.assigns.user.id)
        |> Comment.changeset(comment)

        case Repo.insert(changeset) do
            {:ok, _post} ->
                conn
                |> json(comment)
            {:error, _changeset} ->
                conn
                |> send_resp(500, %{"message" => "error creating", "comment" => comment})
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