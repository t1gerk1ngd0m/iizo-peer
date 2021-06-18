class CreateIizoStamps < ActiveRecord::Migration[6.1]
  def change
    create_table :iizo_stamps do |t|
      t.references :to_user, type: :uuid, null: false, foreign_key: { to_table: :users }
      t.references :from_user, type: :uuid, null: false, foreign_key: { to_table: :users }
      t.integer :slack_event_type, null: false, default: 0
      t.string :slack_event_id, null: false, default: ''

      t.timestamps
    end
  end
end
