class User < ActiveRecord::Base
  # Remember to create a migration!
      # ej. User.authenticate('fernando@codea.mx', 'qwerty')

  include BCrypt

  has_many :relation #Un usuario tiene muchas relaciones
  has_many :reputation #Un usuario puede tener muchas relaciones
  has_one :infoper #Un usuario solo tiene una informacion
  
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
    user = User.find_by(mail: email)
    if user && (user.password == user_password)
      return user
    else
      nil
    end  
  end  

end
