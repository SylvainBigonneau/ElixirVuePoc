defmodule DiscussVue.User do
    use DiscussVue.Web, :model

    schema "users" do
        field :email, :string
        field :provider, :string
        field :token, :string
        has_many :topics, DiscussVue.Topic
        has_many :comments, DiscussVue.Comment

        timestamps()
    end

    def changeset(struct, params \\ %{}) do
        struct
        |> cast(params, [:email, :provider, :token])
        |> validate_required([:email, :provider, :token])
    end
end