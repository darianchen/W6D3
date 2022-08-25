class CreateArtWorkShares < ActiveRecord::Migration[7.0]
  def change
    create_table :art_work_shares do |t|
      t.references :artwork, null: false, foreign_key: { to_table: :artworks }
      t.references :viewer, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
     add_index :art_work_shares, [:artwork_id, :viewer_id], unique: true
  end
end
