class CreateRelation < ActiveRecord::Migration
  def change
    create_table :relations do |g|
      g.string :sudo
      g.belongs_to :enterprise, index: true
      g.belongs_to :user, index: true
      g.timestamp 
    end
  end
end
