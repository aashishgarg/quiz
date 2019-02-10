class CreateAttempts < ActiveRecord::Migration[5.2]
  def change
    create_table :attempts do |t|
      t.references :quiz, foreign_key: true
      t.references :option, foreign_key: true

      t.timestamps
    end
  end
end
