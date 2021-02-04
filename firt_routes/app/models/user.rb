class User < ApplicationRecord
    validates :email, presence: true
    validates :name, presence: true

    has_many :artworks
      foreign_id: :artist_id
      class_name: :Artwork

    has_many :shares
        foreign_key: :viewer_id
        class_name: :ArtworkShare

end