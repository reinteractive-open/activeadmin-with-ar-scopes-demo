100.times do
  Organisation.create(name: Faker::Company.name)
end

all_organisations = Organisation.all

1000.times do
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, organisation: all_organisations.sample)
end

all_users = User.all

1000.times do
  Address.create(street: Faker::Address.street_address, city: Faker::Address.city,
     state: Faker::Address.state, zip: Faker::Address.zip, user: all_users.sample)
end
