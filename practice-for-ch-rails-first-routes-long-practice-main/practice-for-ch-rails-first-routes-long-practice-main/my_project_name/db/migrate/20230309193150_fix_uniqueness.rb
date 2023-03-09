class FixUniqueness < ActiveRecord::Migration[7.0]
  def change
    add_index :artwork_shares, [:artwork_id, :view_id], unique: true
  end
end
