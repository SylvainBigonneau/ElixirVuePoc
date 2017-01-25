defmodule DiscussVue.Comment do
    use DiscussVue.Web, :model

    schema "comments" do
        field :content, :string
        belongs_to :user, DiscussVue.User
        belongs_to :topic, DiscussVue.Topic
    end

    def changeset(struct, params \\ %{}) do
        struct
        |> cast(params, [:content])
        |> validate_required([:content])
    end
end