class AddProjectToChecklist < ActiveRecord::Migration[5.2]
  def change
    add_column :checklists, :project, :string
  end
end
