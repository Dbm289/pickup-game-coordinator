class CreateCourts < ActiveRecord::Migration[5.1]
  def change
    create_table :courts do |t|
      t.string :name
      t.integer :quality

      t.timestamps null: false
    end
  end
end
