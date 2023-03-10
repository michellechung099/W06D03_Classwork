class Comment < ApplicationRecord
    validates :body, presence: true
    validates :author_id, :artwork_id, presence: true

    belongs_to :author,
        foreign_key: :author_id,
        class_name: :User

    belongs_to :artwork,
        foreign_key: :artwork_id,
        class_name: :Artwork

end