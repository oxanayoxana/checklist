# frozen_string_literal: true

# == Schema Information
#
# Table name: checklists
#
#  id          :bigint           not null, primary key
#  description :text
#  name        :string
#  status      :integer          default("draft")
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  project_id  :bigint
#
# Indexes
#
#  index_checklists_on_project_id  (project_id)
#
# Foreign Keys
#
#  fk_rails_...  (project_id => projects.id)
#

class Checklist < ApplicationRecord
  has_many :questions, inverse_of: :checklist, dependent: :destroy
  
  belongs_to :project

  accepts_nested_attributes_for :questions, reject_if: :all_blank, allow_destroy: true
  
  validates :name, :description, presence: true
  
  enum status: %w[draft published]
end
