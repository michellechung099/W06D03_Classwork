# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  email      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
#  create_table "users", force: :cascade do |t|
#     t.string "username", null: false
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#     t.index ["username"], name: "index_users_on_username", unique: true
#   end
class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true

    has_many :artworks,
      foreign_key: :artist_id,
      class_name: :Artwork,
      dependent: :destroy
end
