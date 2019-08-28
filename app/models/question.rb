# frozen_string_literal: true

# == Schema Information
#
# Table name: questions
#
#  id          :bigint           not null, primary key
#  comment     :text
#  description :text
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  form_id     :bigint
#
# Indexes
#
#  index_questions_on_form_id  (form_id)
#
# Foreign Keys
#
#  fk_rails_...  (form_id => forms.id)
#

class Question < ApplicationRecord
  belongs_to :form
  has_many :answers, dependent: :destroy
  
  validates :title, :description, :form_id, presence: true
end
