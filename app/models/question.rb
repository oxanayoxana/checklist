# frozen_string_literal: true

# == Schema Information
#
# Table name: questions
#
#  id          :bigint           not null, primary key
#  comment     :text
#  description :text
#  status      :integer          default(0)
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
  
  validates :title, :description, presence: true
end
