# frozen_string_literal: true

# == Schema Information
#
# Table name: questions
#
#  id          :bigint           not null, primary key
#  comment     :text
#  description :text
#  status      :integer          default("none")
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Question < ApplicationRecord
  enum status: %w[none n/a yes no]
end
