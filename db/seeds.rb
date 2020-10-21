# User.destroy_all
# Beer.destroy_all
# UserBeer.destroy_all

# 10.times do 
#     User.create(name: Faker::Name.name, gender: Faker::Gender.binary_type, age: rand(21..75), location: Faker::Address.zip)
# end

# 30.times do 
#     Beer.create(name: Faker::Beer.name, description: Faker::Beer.brand, cat_name: Faker::Beer.style, country: Faker::Address.country, abv: Faker::Beer.alcohol)
# end

# 15.times do
#     UserBeer.create(
#         user: User.all.sample, 
#         beer: Beer.all.sample,
#         has_tried: true)
#     end

# 5.times do
#     UserBeer.create(
#         user: User.all.sample,
#         beer: Beer.find(1),
#         has_tried: true
#     )
# end