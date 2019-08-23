# frozen_string_literal: true

# == Schema Information
#
# Table name: questions
#
#  id           :bigint           not null, primary key
#  comment      :text
#  description  :text
#  status       :integer          default("status_none")
#  title        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  checklist_id :bigint
#
# Indexes
#
#  index_questions_on_checklist_id  (checklist_id)
#
# Foreign Keys
#
#  fk_rails_...  (checklist_id => checklists.id)
#

class Question < ApplicationRecord
  # COMMENT_MIN_LENGTH = 12
  belongs_to :checklist
  
  validates :title, :description, presence: true
  # validates :comment, length: { minimum: COMMENT_MIN_LENGTH }, allow_nil: true

  # enum status: %w[status_none n/a yes no]
end
