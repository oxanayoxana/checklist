class AddChecklistToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_reference :questions, :checklist, foreign_key: true
  end
end
