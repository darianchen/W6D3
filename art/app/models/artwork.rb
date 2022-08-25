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

    validates :title, uniqueness: { scope: :artist_id }
    
    belongs_to  :artist,
    primary_key: :id,
        foreign_key: :artist_id,
        class_name: :User


end
