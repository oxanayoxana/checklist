class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.integer :status, default: 0
      t.text :comment

      t.timestamps
    end
  end
end
