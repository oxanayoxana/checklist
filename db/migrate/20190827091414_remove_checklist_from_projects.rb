class RemoveChecklistFromProjects < ActiveRecord::Migration[5.2]
  def change
    remove_reference :projects, :checklist, foreign_key: true
  end
end
