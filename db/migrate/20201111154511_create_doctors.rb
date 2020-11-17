class CreateDoctors < ActiveRecord::Migration[6.0]
  def change
    create_table :doctors do |t|
      t.string :name
      t.string :surname
      t.string :specialization
      t.string :phone_number
      t.string :work_hours
      t.string :photo_url, default: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcR7_qgYWVYJxkoxcc5LoLnKqBZV1ODtvhQQYQ&usqp=CAU"

      t.timestamps
    end
  end
end
