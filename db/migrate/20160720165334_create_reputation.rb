class CreateReputation < ActiveRecord::Migration
  def change
    create_table :reputations do |r|
      r.belongs_to :user, index: true
      r.belongs_to :enterprise, index: true
      r.string :ocupation
      r.string :description
      r.timestamp
    end
  end
end
