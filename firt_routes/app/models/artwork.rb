class Artwork < ApplicationRecord
    validates :title, presence: true,
      uniqueness: { scope: :artist_id,
      message: "You already have a work of that title" }
    validates :image_url, presence: true
    validates :artist_id, presence: true

    belongs_to :artist
      foreign_id: :artist_id
      class_name: :User

    has_many :shares
      foreign_key: :artwork_id
      class_name: :ArtworkShare

end