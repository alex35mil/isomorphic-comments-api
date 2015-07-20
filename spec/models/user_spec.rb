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

require 'rails_helper'

RSpec.describe User, type: :model do

  subject(:user) { FactoryGirl.create :user }

  it { is_expected.to be_valid }

  it { is_expected.to respond_to :email }
  it { is_expected.to respond_to :password }
  it { is_expected.to respond_to :password_confirmation }

  it { is_expected.to validate_presence_of :email }
  it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
  it { is_expected.to allow_value('foo@bar.com').for(:email) }
  it { is_expected.not_to allow_value('foo', 'foo@bar', 'bar.com' ).for(:email) }

  it { is_expected.to validate_presence_of :password }
  it { is_expected.to validate_confirmation_of :password }

  it 'has encrypted_password' do
    expect(user.encrypted_password).not_to be_blank
  end

  it 'has authentication_token' do
    expect(user.authentication_token).not_to be_blank
  end

  context 'when email has capital letters' do
    subject(:user) { FactoryGirl.create :user, email: 'FOO@BAR.COM' }
    it 'saves email downcased' do
      expect(user.email).to eq user.email.downcase
    end
  end

end
