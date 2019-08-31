class RemoveColumnsFromChecklists < ActiveRecord::Migration[5.2]
  def change
    remove_column :checklists, :name, :string
    remove_column :checklists, :description, :text
    remove_column :checklists, :status, :integer
  end
end
