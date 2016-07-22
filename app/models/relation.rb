class Relation < ActiveRecord::Base
  # Remember to create a migration!
  has_one :repute

  validates :sudo , presence: true , confirmation: true
  #Preguntar si se puede meter a un metodo las validaciones
  # validates :enterprise_id , presence: true , confirmation: true
  validates :user_id , presence: true , confirmation: true

end
