class CreateEnterprise < ActiveRecord::Migration
  def change
    create_table :enterprises do |e|
      e.string :mail,  :unique => true
      e.string :pk_id,  :unique => true
      e.string :password_digest
      e.timestamp
    end
  end
end
