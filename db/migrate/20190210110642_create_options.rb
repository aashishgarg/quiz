class CreateOptions < ActiveRecord::Migration[5.2]
  def change
    create_table :options do |t|
      t.references :question, foreign_key: true
      t.text :description
      t.boolean :is_answer, default: false

      t.timestamps
    end
  end
end
