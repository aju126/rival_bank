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

  UserAccount.create!(user_name: 'aj', password: '123456', user_information: ui, roles: [role_admin])
