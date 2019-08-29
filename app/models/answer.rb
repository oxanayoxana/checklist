# == Schema Information
#
# Table name: answers
#
#  id           :bigint           not null, primary key
#  comment      :text
#  status       :integer          default("status_none")
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  checklist_id :bigint
#  question_id  :bigint
#
# Indexes
#
#  index_answers_on_checklist_id  (checklist_id)
#  index_answers_on_question_id   (question_id)
#
# Foreign Keys
#
#  fk_rails_...  (checklist_id => checklists.id)
#  fk_rails_...  (question_id => questions.id)
#

class Answer < ApplicationRecord
  STATUS      = %i[status_none n/a yes no].freeze
  enum status: STATUS

  COMMENT_MIN_LENGTH = 12

  belongs_to :question, optional: true
  belongs_to :checklist

  # validates :comment, length: { minimum: COMMENT_MIN_LENGTH }, allow_nil: true
  validates :comment, :status, presence: true
end
