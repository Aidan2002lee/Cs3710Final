json.extract! playlist, :id, :name, :capacity_of_songs, :description, :account_id, :created_at, :updated_at
json.url playlist_url(playlist, format: :json)
