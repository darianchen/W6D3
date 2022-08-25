# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

  
#   ActiveRecord::Base.transaction do
#     puts "Preparing #{Rails.env} environment"
  
    puts 'Destroying tables...'
    ArtworkShares.delete_all
    Artwork.delete_all
    User.delete_all
    
    puts 'Creating seed data...'
    shawn = User.create!(
      username: "shawn",
    )
  
    darian = User.create!(
    username: "darian",
    )
  
    mona_lisa = Artwork.create!(
      title: "Mona Lisa",
      image_url: "www.google.com/monalisa",
      artist_id: shawn.id
    )

    boat = Artwork.create!(
        title: "boat",
        image_url: "www.google.com/boat",
        artist_id: darian.id
      )