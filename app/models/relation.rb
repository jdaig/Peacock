class Relation < ActiveRecord::Base
  # Remember to create a migration!
  validates :sudo , presence: true , confirmation: true
  validates :enterprise_id , presence: true , confirmation: true
  validates :user_id , presence: true , confirmation: true

end
