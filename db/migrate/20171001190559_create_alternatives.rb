class CreateAlternatives < ActiveRecord::Migration[5.1]
  def change
    create_table :alternatives, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.text :title
      t.references :question, type: :uuid, index: true, foreign_key: true
      t.integer :position

      t.timestamps
    end

    add_index :alternatives, %i[title question_id], unique: true
  end
end
