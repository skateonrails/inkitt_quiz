class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.text :title, uniqueness: true
      t.uuid :parent_id

      t.timestamps
    end
  end
end
