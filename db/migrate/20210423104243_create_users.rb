class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name, null: false, default: ''
      t.string :email, null: false, default: ''
      t.string :provider, null: false, default: ''
      t.string :uid, null: false, default: ''
      t.string :token, null: false, default: ''
      t.string :channel, null: false, default: ''

      t.timestamps
    end
  end
end
