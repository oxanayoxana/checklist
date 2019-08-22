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
  enum status: %w[draft published]

  has_many :questions, dependent: :destroy

  validates :name, :description, :project_id, presence: true
end
