helpers do

  def current_user
    if session[:id]
      @current_user ||= User.find_by_id(session[:id])
    end
  end

  def logged_in?
    !current_user.nil?
  end

  def current_enterprise
    if session[:id]
      @current_user ||= Enterprise.find_by_id(session[:id])
    end
  end

  def exist?(mail)
    if login_find(mail)
      true 
    else 
      false
    end
  end

  def log_nil?(iam,mail,pk,pas)
    if iam.nil? || mail.nil? || pas.nil? || pk.nil?
      false
    else
      true
    end
  end

  def login_find(mail)
    if u = User.find_by(mail: mail) 
      u
    elsif e = Enterprise.find_by(mail: mail)
      e
    end
  end

end
