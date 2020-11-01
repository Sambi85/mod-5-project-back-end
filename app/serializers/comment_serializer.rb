class CommentSerializer < ActiveModel::Serializer
    attributes :id, :description, :date, :created_at, :updated_at

    has_one :user
    has_one :post
    has_many :replies
end