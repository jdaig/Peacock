class CreateInfoper < ActiveRecord::Migration
  def change
    create_table :infopers do |p|
      p.belongs_to :user, index: true
      p.string :name_per
      p.string :lname_per
      p.string :born
      p.string :ocupation
      p.string :soc_stat
      # p.string :pk_id,  :unique => true
      p.string :country
      p.string :state
      p.string :street
      p.string :n_int
      p.string :n_ext
      p.string :page
      p.string :description
      p.timestamp
    end
  end
end
