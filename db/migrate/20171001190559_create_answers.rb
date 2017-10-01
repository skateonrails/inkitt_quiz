class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.text :title, index: { unique: true }
      t.references :question, type: :uuid, index: true, foreign_key: true
      t.integer :position

      t.timestamps
    end
  end
end
