class CreatePlaylists < ActiveRecord::Migration[7.1]
  def change
    create_table :playlists do |t|
      t.string :name
      t.integer :capacity_of_songs
      t.text :description
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
