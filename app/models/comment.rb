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

class Comment < ActiveRecord::Base

  validates_presence_of :author, :comment
  
end
