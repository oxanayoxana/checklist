# == Schema Information
#
# Table name: checklists
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  form_id    :bigint
#
# Indexes
#
#  index_checklists_on_form_id  (form_id)
#
# Foreign Keys
#
#  fk_rails_...  (form_id => forms.id)
#

class Checklist < ApplicationRecord
  has_many :answers, inverse_of: :checklist, dependent: :destroy 
end
