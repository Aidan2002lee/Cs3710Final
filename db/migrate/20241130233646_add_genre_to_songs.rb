class AddGenreToSongs < ActiveRecord::Migration[7.1]
  def change
    add_column :songs, :genre, :string
  end
end
