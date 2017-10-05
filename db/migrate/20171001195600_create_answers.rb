class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.references :user, type: :uuid, index: true, foreign_key: true
      t.references :question, type: :uuid, index: true, foreign_key: true
      t.references :alternative, type: :uuid, index: true, foreign_key: true

      t.timestamps
    end

    add_index :answers, %i[user_id question_id], unique: true
  end
end
