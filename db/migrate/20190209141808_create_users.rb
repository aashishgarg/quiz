class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.boolean :is_admin, default: false

      t.timestamps
    end

    add_index :users, :email
    add_index :users, :name
    add_index :users, :is_admin
  end
end
