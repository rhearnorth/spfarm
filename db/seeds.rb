# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email
# Environment variables (ENV['...']) can be set in the file .env file.

contract_plans = [
  {
    hash_rate: 20,
    price: 30000,
    contract_long: 24
  },
  {
    hash_rate: 50,
    price: 71250,
    contract_long: 24
  },
  {
    hash_rate: 100,
    price: 136500,
    contract_long: 24
  },
  {
    hash_rate: 410,
    price: 535050,
    contract_long: 24
  },
]
ContractPlan.create(contract_plans)
puts "CREATE ContractPlan"
