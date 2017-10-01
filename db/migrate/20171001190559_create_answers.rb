class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.text :title
      t.references :question, type: :uuid, index: true, foreign_key: true
      t.integer :position

      t.timestamps
    end
  end
end
