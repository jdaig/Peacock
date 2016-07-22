class CreateRelation < ActiveRecord::Migration
  def change
    create_table :relations do |g|
      g.string :sudo #usar como un parametro de validacion para evaluar
      g.belongs_to :enterprise, index: true
      g.belongs_to :user, index: true
      g.string :evaluate #usar conjuntamente con sudo como un parametro de validacion
      g.timestamp 
    end
  end
end
