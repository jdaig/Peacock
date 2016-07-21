class Enterprise < ActiveRecord::Base
  # Remember to create a migration!
  
include BCrypt
  
  has_many :relation #Una empresa tiene muchas relaciones
  has_one :info #Una empresa tiene una informacion
  has_one :reputation #Una empresa tiene una reputacion
  
  validates :mail , presence: true , confirmation: true
  validates :pk_id , presence: true , confirmation: true
  validates :password_digest , presence: true , confirmation: true
  validates :mail, uniqueness: true
  validates :pk_id, uniqueness: true
  
  def password
    @password ||= Password.new(password_digest)
  end

  def password=(user_password)
    @password = Password.create(user_password)
    self.password_digest = @password
  end

  def self.authenticate(email, user_password)
    user = Enterprise.find_by(mail: email)
    if user && (user.password == user_password)
      return user
    else
      nil
    end  
  end  

end
