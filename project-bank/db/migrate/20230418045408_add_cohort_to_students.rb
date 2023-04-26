class AddCohortToStudents < ActiveRecord::Migration[7.0]
  def change
    add_reference :students, :cohort, null: false, foreign_key: true
  end
end
