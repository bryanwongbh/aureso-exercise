# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Create a user
User.create!(email: "user@example.com", password: "password")

# Creates a sample organizations

bmw = Organization.create!(name: "BMW", public_name: "BMW", type: "Service", pricing_policy: "Flexible")
porsche = Organization.create!(name: "Porsche", public_name: "Porsche", type: "Show room", pricing_policy: "Fixed")
mercedez = Organization.create!(name: "Mercedez", public_name: "Mercedez", type: "Dealer", pricing_policy: "Prestige")

# Creates sample models

serie_1 = bmw.models.create!(name: "Series 1")
serie_3 = bmw.models.create!(name: "Series 3")

cayman = porsche.models.create!(name: "Porsche Cayman")
cayenne = porsche.models.create!(name: "Porsche Cayenne")

s_class = mercedez.models.create!(name: "S Class")
sl_class = mercedez.models.create!(name: "SL Class")

# Creates sample model_types

serie_1.model_types.create!(name: "BMW 116i", model_type_code: "116i", base_price: 180000)
serie_1.model_types.create!(name: "BMW 125i", model_type_code: "125i", base_price: 205000)
serie_3.model_types.create!(name: "BMW 320i", model_type_code: "320i", base_price: 285000)
serie_3.model_types.create!(name: "BMW 330", model_type_code: "330", base_price: 335000)

cayman.model_types.create!(name: "Porsche Cayman", model_type_code: "cayman", base_price: 254000)
cayman.model_types.create!(name: "Porsche Cayman GT4", model_type_code: "gt4", base_price: 433000)
cayenne.model_types.create!(name: "Porsche Cayenne", model_type_code: "cayenne", base_price: 322000)
cayenne.model_types.create!(name: "Porsche Cayenne Turbo S", model_type_code: "turbo_s", base_price: 750000)

s_class.model_types.create!(name: "Mercedez S 320", model_type_code: "s320", base_price: 395000)
s_class.model_types.create!(name: "Mercedez S 400", model_type_code: "s400", base_price: 439000)
sl_class.model_types.create!(name: "Mercedez SL 400", model_type_code: "sl400", base_price: 451000)
sl_class.model_types.create!(name: "Mercedez SL 500", model_type_code: "sl500", base_price: 579000)
