class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :emp_id, null: false
      t.string :first_name
      t.string :last_name
      t.string :email, null: false
      t.date :doj, null: false
      t.decimal :salary_per_month, null: false

      t.timestamps
    end
  end
end
