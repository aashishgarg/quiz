class CreateQuizsets < ActiveRecord::Migration[5.2]
  def change
    create_table :quizsets do |t|

      t.timestamps
    end
  end
end
