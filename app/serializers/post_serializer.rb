class PostSerializer < ActiveModel::Serializer
    attributes :id, :img, :description, :date

    has_one :user
    has_many :comments
    has_many :likes
    
end