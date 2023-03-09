#   create_table "artworks", force: :cascade do |t|
#     t.string "title", null: false
#     t.bigint "artist_id", null: false
#     t.string "image_url", null: false
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#     t.index ["artist_id", "title"], name: "index_artworks_on_artist_id_and_title", unique: true
#     t.index ["artist_id"], name: "index_artworks_on_artist_id"
#     t.index ["image_url"], name: "index_artworks_on_image_url", unique: true
#   end
class Artwork < ApplicationRecord
    validates :title, presence: true
    validates :image_url, :artist_id, presence: true, uniqueness: true
    
    belongs_to :artist,
        foreign_key: :artist_id,
        class_name: :User
end