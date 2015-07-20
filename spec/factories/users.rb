# == Schema Information
#
# Table name: users
#
#  id                   :integer          not null, primary key
#  email                :string           default(""), not null
#  encrypted_password   :string           default(""), not null
#  authentication_token :string           default(""), not null
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

FactoryGirl.define do

  factory :user do
    email                 { Faker::Internet.email }
    password              '123456789'
    password_confirmation '123456789'
  end

end
