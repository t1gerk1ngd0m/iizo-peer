class CreateTeams < ActiveRecord::Migration[6.1]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')
    create_table :teams, id: :uuid do |t|
      t.string :slack_id, null: false, default: '', comment: 'SlackチームID'
      t.string :slack_name, null: false, default: '', comment: 'Slackチーム名'
      t.string :slack_domain, null: false, default: '', comment: 'Slackチームドメイン'
      t.string :slack_access_token, null: false, default: '', comment: 'アプリインストール時に発行されたトークン'

      t.timestamps
    end
  end
end
