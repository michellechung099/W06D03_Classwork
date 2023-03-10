# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.destroy_all
Artwork.destroy_all
ArtworkShare.destroy_all
Comment.destroy_all

brandon = User.create(username: "brandon")
michelle = User.create(username: "michelle")
chris = User.create(username: "chris")

art1 = Artwork.create(title: "pancakes", artist_id: brandon.id, image_url: "brandon.com")
art2 = Artwork.create(title: "waffle", artist_id: chris.id, image_url: "chris.com")

artworkshare1 = ArtworkShare.create(artwork_id: art1.id, view_id: michelle.id)
artworkshare2 = ArtworkShare.create(artwork_id: art2.id, view_id: brandon.id)

comment1 = Comment.create(body: "wow so good!", author_id: chris.id, artwork_id: art1.id)

