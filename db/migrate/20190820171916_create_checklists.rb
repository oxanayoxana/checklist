# frozen_string_literal: true

class CreateChecklists < ActiveRecord::Migration[5.2]
  def change
    create_table :checklists do |t|
      t.string :name
      t.text :description
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
