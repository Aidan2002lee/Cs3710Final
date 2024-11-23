class AccountSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :num_of_songs_you_want, :username
end
