class CreateInfo < ActiveRecord::Migration
  def change
    create_table :infos do |t|
      t.belongs_to :enterprise, index: true
      t.string :name_ent
      t.string :ceo_ent
      t.string :country
      t.string :state
      t.string :street
      t.string :n_int
      t.string :n_ext
      t.string :page
      t.string :type
      t.string :description
      t.timestamp
    end

  end
end
