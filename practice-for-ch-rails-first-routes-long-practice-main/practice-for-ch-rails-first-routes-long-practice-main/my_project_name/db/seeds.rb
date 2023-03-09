# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

brandon = User.create(username: "brandon")
michelle = User.create(username: "michelle")

art1 = Artwork.create(title: "pancakes", artist_id: brandon.id, image_url: "brandon.com")

artworkshare1 = ArtworkShare.create(artwork_id: art1.id, view_id: michelle.id)
