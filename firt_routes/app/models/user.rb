class User < ApplicationRecord
    validates :email, presence: true
    validates :name, presence: true

    has_many :artworks,
      foreign_key: :artist_id,
      class_name: :Artwork,
      dependent: :destroy

    has_many :shares,
        foreign_key: :viewer_id,
        class_name: :ArtworkShare,
        dependent: :destroy

    has_many :shared_artworks,
      through: :shares,
      source: :artwork

end