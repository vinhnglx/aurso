class CreateApiTokens < ActiveRecord::Migration
  def change
    create_table :api_tokens do |t|
      t.string :access_token

      t.timestamps null: false
    end
  end
end
