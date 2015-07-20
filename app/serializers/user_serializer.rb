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

class UserSerializer < ActiveModel::Serializer

  attributes :id, :email, :authentication_token

end
