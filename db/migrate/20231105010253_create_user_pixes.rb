# frozen_string_literal: true

# Create userpix table migration
class CreateUserPixes < ActiveRecord::Migration[7.1]
  def change
    enable_extension 'pgcrypto'
    create_table :user_pixes, id: :uuid do |t|
      t.string :username
      t.string :keytype
      t.string :key

      t.timestamps
    end
  end
end
