# frozen_string_literal: true

# == Schema Information
#
# Table name: projects
#
#  id         :bigint           not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  form_id    :bigint
#
# Indexes
#
#  index_projects_on_form_id  (form_id)
#
# Foreign Keys
#
#  fk_rails_...  (form_id => forms.id)
#

class Project < ApplicationRecord
  belongs_to :form

  validates :title, presence: true
end
