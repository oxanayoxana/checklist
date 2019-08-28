class RemoveCommentFromQuestions < ActiveRecord::Migration[5.2]
  def change
    remove_column :questions, :comment, :text
  end
end
