class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users, id: :uuid do |t|
      t.string :slack_id, null: false, default: '', comment: 'SlackユーザーID'
      t.string :slack_name, null: false, default: '', comment: 'Slackユーザー名'
      t.references :team, type: :uuid, null: false, foreign_key: true

      t.timestamps
    end
  end
end
