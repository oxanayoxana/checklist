class RemoveChecklistFromAnswers < ActiveRecord::Migration[5.2]
  def change
    remove_reference :answers, :checklist, foreign_key: true
  end
end
