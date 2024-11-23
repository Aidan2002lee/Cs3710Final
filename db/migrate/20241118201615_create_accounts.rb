class CreateAccounts < ActiveRecord::Migration[7.1]
  def change
    create_table :accounts do |t|
      t.string :first_name
      t.string :last_name
      t.integer :num_of_songs_you_want
      t.string :username

      t.timestamps
    end
  end
end
