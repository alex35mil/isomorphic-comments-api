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

class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable, :validatable

  acts_as_token_authenticatable

end
