# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  title      :string
#  image_url  :string
#  artist_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Artwork < ApplicationRecord

    validates :title, presence: true, uniqueness: { scope: :artist_id }
    validates :image_url, presence: true, uniqueness: true
    validates :artist_id, presence:

    belongs_to  :artist,
    primary_key: :id,
        foreign_key: :artist_id,
        class_name: :User

    has_many :artwork_share,
        primary_key: :id,
        foreign_key: :artwork_id,
        class_name: :ArtWorkShares,
        dependent: :destroy

    has_many :artwork_shares,
        through: :artwork_share,
        source: :shared_viewers
end