class AddChecklistToProject < ActiveRecord::Migration[5.2]
  def change
    add_reference :projects, :checklist, foreign_key: true
  end
end
