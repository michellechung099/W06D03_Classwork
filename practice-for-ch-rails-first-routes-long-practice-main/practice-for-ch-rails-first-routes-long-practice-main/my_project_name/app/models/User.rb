# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  username   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true

    has_many :artworks,
      foreign_key: :artist_id,
      class_name: :Artwork,
      inverse_of: :artist,
      dependent: :destroy

    has_many :viewed_artwork,
      foreign_key: :view_id,
      class_name: :ArtworkShare,
      inverse_of: :viewer,
      dependent: :destroy

    has_many :shared_artworks,
      through: :viewed_artwork,
      source: :artwork

    has_many :artwork_comments,
      foreign_key: :author_id,
      class_name: :Comment,
      inverse_of: :author,
      dependent: :destroy


end
