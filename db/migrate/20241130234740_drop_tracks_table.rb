class DropTracksTable < ActiveRecord::Migration[7.1]
  def change
    drop_table :tracks
  end
end
