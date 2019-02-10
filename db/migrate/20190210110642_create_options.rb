class CreateOptions < ActiveRecord::Migration[5.2]
  def change
    create_table :options do |t|
      t.references :question, foreign_key: true
      t.text :description

      t.timestamps
    end

    # Join Table
    create_table "answers_questions", id: false, force: :cascade do |t|
      t.integer "option_id", null: false
      t.integer "question_id",  null: false
    end
  end
end
