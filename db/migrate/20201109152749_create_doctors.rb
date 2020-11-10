class CreateDoctors < ActiveRecord::Migration[6.0]
  def change
    create_table :doctors do |t|
      t.string :name
      t.string :surname
      t.string :specialization
      t.string :phone_number
      t.string :work_hours

      t.timestamps
    end
  end
end
