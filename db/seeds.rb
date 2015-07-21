require 'rspec/expectations'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

case Rails.env.to_s
when 'development'
# development-specific seeds ...
# (anything you need to interactively play around with in the rails console)

when 'test'
  # include RSpec::Matchers   # important !
  # test-specific seeds ...
  # (Consider having your tests set up the data they need
  # themselves instead of seeding it here!)
  # user password moondance
  organization = Organization.create(name: 'tbl', type: 'Photographer', uuid: 'ec57e2e0-0b25-11e4-b789-12313d1c956c')

  user = User.new(email: 'synthia_user@tbl_user.com',
                  name: 'Cynthia User',
                  type: 'Photographer',
                  title: 'Mr',
                  first_name: 'Cynthia',
                  last_name: 'User',
                  uuid: 'ec57e2e0-0b25-11e4-b789-12313d1c956c')
  user.password = 'moondance'
  user.encrypted_password = 'bc8e36b58027b6d560f08a90023230cfffb3b85e'
  user.password_salt = '1SqGvNeuvZfNj8SI75oH'
  user.save

  organization.users << user

when 'production'
  # production seeds (if any) ...

#rake db:seed
when 'qa'
  Admin.new(email: 'Lucas@xogrp.com', password: 'abcd123!').save
end

# common seeds ...
# (data your application needs in all environments)
