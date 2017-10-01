class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.string :email, unique: true, index: true
      t.text :fingerprint_hash

      t.timestamps
    end
  end
end
