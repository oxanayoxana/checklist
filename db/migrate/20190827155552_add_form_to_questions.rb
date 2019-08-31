class AddFormToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_reference :questions, :form, foreign_key: true
  end
end
