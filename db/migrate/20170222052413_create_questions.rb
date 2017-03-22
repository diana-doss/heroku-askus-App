class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.text :question
      t.string :description
      t.string :skills
      t.integer :question_id

      t.timestamps
    end
  end
end
