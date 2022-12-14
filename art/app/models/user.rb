# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  username   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord

    validates :username, presence: true, uniqueness: { message: "Username already taken"}
    
    
    has_many :artworks,
        primary_key: :id,
        foreign_key: :artist_id,
        class_name: :Artwork,
        dependent: :destroy


    has_many :artwork_share,
        primary_key: :id,
        foreign_key: :viewer_id,
        class_name: :ArtWorkShares,
        dependent: :destroy

    has_many :viewed_artworks,
        through: :artwork_share,
        source: :shared_artworks
    
end
