class CreateQuestionAttempts < ActiveRecord::Migration[5.2]
  def change
    create_table :question_attempts do |t|
      t.references :user, foreign_key: true
      t.references :question, foreign_key: true
      t.references :option, foreign_key: true

      t.timestamps
    end
  end
end
