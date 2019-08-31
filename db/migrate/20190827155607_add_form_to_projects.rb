class AddFormToProjects < ActiveRecord::Migration[5.2]
  def change
    add_reference :projects, :form, foreign_key: true
  end
end
