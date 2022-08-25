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

   def self.artworks_for_user_id(user)
        user_viewer = self 
            .select(:title, :artist_id)
            .joins(:shared_artworks)
            .where("artwork_shares.viewer_id = (?), user")

        user_art = self 
            .select(:title, :viewer_id)
            .where(artist_id: user)

        return user_art.to_a.concat(user_viewer.to_a) 
   end


    validates :title, presence: true, uniqueness: { scope: :artist_id }
    
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