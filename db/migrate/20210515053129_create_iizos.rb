class CreateIizos < ActiveRecord::Migration[6.1]
  def change
    create_table :iizos, id: :uuid do |t|
      t.references :to_user, type: :uuid, null: false, foreign_key: { to_table: :users }
      t.references :from_user, type: :uuid, null: false, foreign_key: { to_table: :users }
      t.text :message
      t.string :response_url

      t.timestamps
    end
  end
end
