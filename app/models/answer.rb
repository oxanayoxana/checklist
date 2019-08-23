# == Schema Information
#
# Table name: answers
#
#  id          :bigint           not null, primary key
#  comment     :text
#  status      :integer          default(0)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  question_id :bigint
#
# Indexes
#
#  index_answers_on_question_id  (question_id)
#
# Foreign Keys
#
#  fk_rails_...  (question_id => questions.id)
#

class Answer < ApplicationRecord
  enum status: %w[status_none n/a yes no]

  COMMENT_MIN_LENGTH = 12

  belongs_to :question

  validates :comment, length: { minimum: COMMENT_MIN_LENGTH }, allow_nil: true
  validates :comment, :status, :question_id, presence: true
end
