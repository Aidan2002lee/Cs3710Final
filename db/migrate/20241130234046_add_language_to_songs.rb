class AddLanguageToSongs < ActiveRecord::Migration[7.1]
  def change
    add_column :songs, :language, :string
  end
end
