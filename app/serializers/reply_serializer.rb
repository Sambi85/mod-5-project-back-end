class ReplySerializer < ActiveModel::Serializer
    attributes :id, :date, :description, :created_at, :updated_at

    has_one :comment
    has_one :user
end