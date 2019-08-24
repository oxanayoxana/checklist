# frozen_string_literal: true

# == Schema Information
#
# Table name: projects
#
#  id           :bigint           not null, primary key
#  title        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  checklist_id :bigint
#
# Indexes
#
#  index_projects_on_checklist_id  (checklist_id)
#
# Foreign Keys
#
#  fk_rails_...  (checklist_id => checklists.id)
#

class Project < ApplicationRecord
  belongs_to :checklist

  validates :title, presence: true
end
