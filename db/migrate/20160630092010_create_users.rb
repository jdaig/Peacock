class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |u|
      # u.belongs_to :enterprise, index: true
      u.string :mail,  :unique => true
      u.string :pk_id,  :unique => true
      u.string :password_digest
      u.timestamps
    end
  end
end