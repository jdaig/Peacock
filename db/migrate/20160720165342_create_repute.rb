class CreateRepute < ActiveRecord::Migration
  def change
    create_table :reputes do |q|
      q.belongs_to :reputation, index: true
      q.belongs_to :relation, index: true
      q.string :stars
      q.string :commit
      q.timestamp
    end
  end
end
