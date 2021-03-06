class CreateQuizzes < ActiveRecord::Migration[5.2]
  def change
    create_table :quizzes do |t|
      t.string :name

      t.timestamps
    end
  end

  # Join Table
  create_table "questions_quizzes", id: false, force: :cascade do |t|
    t.integer "question_id", null: false
    t.integer "quiz_id",  null: false
  end

  # Join Table
  create_table "quizsets_quizzes", id: false, force: :cascade do |t|
    t.integer "quizset_id", null: false
    t.integer "quiz_id",  null: false
  end

  add_index :questions_quizzes, [:question_id, :quiz_id], :unique => true
  add_index :quizsets_quizzes, [:quizset_id, :quiz_id], :unique => true
end
