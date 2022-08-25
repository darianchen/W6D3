# == Schema Information
#
# Table name: artwork_shares
#
#  id         :bigint           not null, primary key
#  artwork_id :bigint           not null
#  viewer_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ArtworkShares < ApplicationRecord

    belongs_to :shared_artworks,
        foreign_key: :artwork_id,
        class_name: :Artwork
    
    belongs_to :shared_viewers,
        foreign_key: :viewer_id,
        class_name: :User


end 

