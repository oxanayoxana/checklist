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
#

class Checklist < ApplicationRecord
  enum status: %w[draft published]
end
