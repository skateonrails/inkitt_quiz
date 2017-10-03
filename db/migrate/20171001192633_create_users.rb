class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.string :email, unique: true, index: true
      t.string :fingerprint_hash, index: true

      t.timestamps
    end

    add_index :users, %i[email fingerprint_hash], unique: true
  end
end
