defmodule DiscussVue.Topic do
    use DiscussVue.Web, :model

    @derive {Poison.Encoder, only: [:title, :id, :user, :comments]}
    schema "topics" do
        field :title, :string
        has_many :comments, DiscussVue.Comment
        belongs_to :user, DiscussVue.User
    end

    def changeset(struct, params \\ %{}) do
        struct
        |> cast(params, [:title])
        |> validate_required([:title])
    end
end