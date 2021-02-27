class CreateUsersTable < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :position
      t.string :alt_position
      t.integer :skill_level
      t.integer :coaching_skill_level
      t.integer :team_id

      t.timestamps null: false


  end
end
