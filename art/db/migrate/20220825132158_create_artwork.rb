class CreateArtwork < ActiveRecord::Migration[7.0]
  def change
    create_table :artworks do |t|
      t.string :title
      t.string :image_url
      t.references :artist, null: false, foreign_key: {to_table: :users}
      t.timestamps
    end
  end
end
