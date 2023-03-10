# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  artist_id  :bigint           not null
#  image_url  :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Artwork < ApplicationRecord
    validates :title, presence: true
    validates :image_url, :artist_id, presence: true, uniqueness: true

    belongs_to :artist,
        foreign_key: :artist_id,
        class_name: :User

    has_many :artwork_shares,
        foreign_key: :artwork_id,
        class_name: :ArtworkShare,
        inverse_of: :artwork,
        dependent: :destroy

    has_many :shared_viewer,
        through: :artwork_shares,
        source: :viewer

    has_many :comments,
        foreign_key: :artwork_id,
        class_name: :Comment,
        inverse_of: :artwork,
        dependent: :destroy

    has_many :likes,
        as: :likeable,
        dependent: :destroy

    def self.artworks_for_user_id(user_id)
        Artwork
            .select("artworks.*")
            .joins(:artwork_shares)
            .where("artworks.artist_id = #{user_id} or artwork_shares.view_id = #{user_id}")
    end
end
