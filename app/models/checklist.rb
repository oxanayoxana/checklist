# == Schema Information
#
# Table name: checklists
#
#  id         :bigint           not null, primary key
#  project    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  form_id    :bigint
#  user_id    :bigint
#
# Indexes
#
#  index_checklists_on_form_id  (form_id)
#  index_checklists_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (form_id => forms.id)
#  fk_rails_...  (user_id => users.id)
#

class Checklist < ApplicationRecord
  belongs_to :user
  belongs_to :form
  
  has_many :answers, inverse_of: :checklist, dependent: :destroy 

  accepts_nested_attributes_for :answers, reject_if: :all_blank, allow_destroy: true

  validates :project, :form_id, :user_id, presence: true
end
