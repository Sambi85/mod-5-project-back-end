class PostSerializer < ActiveModel::Serializer
    attributes :id, :img, :description, :date, :created_at, :updated_at

    has_one :user
    has_many :comments
    has_many :likes
    
end