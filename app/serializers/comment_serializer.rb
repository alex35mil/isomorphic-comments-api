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

class CommentSerializer < ActiveModel::Serializer

  attributes :id, :author, :comment

end
