class RemoveChecklistFromQuestions < ActiveRecord::Migration[5.2]
  def change
    remove_reference :questions, :checklist, foreign_key: true
  end
end
