# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  author     :string           not null
#  comment    :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Comment, type: :model do

  subject(:comment) { FactoryGirl.create :comment }

  it { is_expected.to be_valid }

  it { is_expected.to respond_to :author }
  it { is_expected.to respond_to :comment }

  it { is_expected.to validate_presence_of :author }
  it { is_expected.to validate_presence_of :comment }

end
