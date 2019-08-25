class RemoveProjectFromChecklist < ActiveRecord::Migration[5.2]
  def change
    remove_reference :checklists, :project, foreign_key: true
  end
end
