class CreateCohorts < ActiveRecord::Migration[7.0]
  def change
    create_table :cohorts do |t|
      t.string :name
      t.references :course, null: false, foreign_key: true
      t.integer :number_of_students

      t.timestamps
    end
  end
end
