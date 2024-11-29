class CreateTracks < ActiveRecord::Migration[7.1]
  def change
    create_table :tracks do |t|
      t.string :name
      t.string :artist
      t.string :image
      t.string :preview
      t.string :spotify_id
      t.references :playlist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
