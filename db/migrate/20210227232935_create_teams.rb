class CreateTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :password_digest
      t.integer :creator_id


      t.timestamps null: false
    end
  end
end
