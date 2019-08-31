class AddChecklistToAnswers < ActiveRecord::Migration[5.2]
  def change
    add_reference :answers, :checklist, foreign_key: true
  end
end
