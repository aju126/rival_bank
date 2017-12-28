# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

role_admin = Role.find_or_create_by(name: Role::ROLE_ADMIN)
role_manager = Role.find_or_create_by(name: Role::ROLE_MANAGER)
role_staff = Role.find_or_create_by(name: Role::ROLE_STAFF)
role_account = Role.find_or_create_by(name: Role::ROLE_ACCOUNT_HOLDER)

actions = {actions: ['Credit', 'Debit', 'Request Balance']}
documents = {documents: ['Aadhar', 'Pan Card', 'Passport', 'Ration Card', 'Telephone Bill']}

[actions, documents].each do |object|
  key = object.keys.first
  model = key.to_s.singularize.camelize.constantize
  object[key].each do |value|
    model.create(name: value)
  end
end
  ui = UserInformation.create(name: 'Ajith Kumar',
                         phone: '9986003200',
                         address: 'bangalore',
                         email: 'aju.126@gmail.com'
  )
  balance = AccountBalance.create(balance: 4500)
  balance_account = AccountBalance.create(balance: 8000)

  UserAccount.create!(account_number: '123456',
                      user_name: 'aj',
                      password: '123456',
                      user_information: ui,
                      roles: [role_admin],
                      account_balance: balance
  )


5000.times.each do

  name = Faker::Name.name
  uinfo = UserInformation.create(name: name,
                              phone: Faker::PhoneNumber.cell_phone,
                              address: Faker::Address.street_address,
                              email: Faker::Internet.free_email(name)
  )
  UserAccount.create!(account_number: Faker::Code.ean,
                      user_name: Faker::Internet.user_name(name),
                      password: '123456',
                      user_information: uinfo,
                      roles: [role_account],
                      account_balance: balance_account
  )
end
