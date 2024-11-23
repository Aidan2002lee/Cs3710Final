FactoryBot.define do
    factory(:account) do
        first_name {Faker::Name.first_name}
        last_name {Faker::Name.last_name}
        num_of_songs_you_want {Faker::Integer.num_of_songs_you_want}
        username {Faker::String.username}
        passowrd {"password"}
        password_confirmation {"password"}
    end
end
