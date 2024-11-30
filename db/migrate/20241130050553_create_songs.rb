class CreateSongs < ActiveRecord::Migration[7.1]
  def change
    create_table :songs do |t|
      t.string :title
      t.string :artist
      t.date :release_date
      t.boolean :explicit
      t.string :spotify_id
      t.references :playlist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
