class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.string :email, unique: true, index: true
      t.string :fingerprint_hash, unique: true, index: true

      t.timestamps
    end
  end
end
