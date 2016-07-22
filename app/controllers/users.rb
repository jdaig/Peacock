#enable :sessions

post '/register' do
  # La siguiente linea hace render de la vista 
  # que esta en app/views/index.erb
  user_am = params[:iam]
  user_mail = params[:mail_user]
  user_pk = params[:pk_id]
  user_pass = params[:pass_user]

  if user_am == "person"
    peacock_in = User.new(mail: user_mail, pk_id: user_pk, password: user_pass)
  elsif user_am == "enterprise"
    p '$'*60
    peacock_in = Enterprise.new(mail: user_mail, pk_id: user_pk, password: user_pass)
  end
  p '*'*50
  p peacock_in
  p '*'*50
  if log_nil?(user_am,user_mail,user_pk,user_pass) && !exist?(user_mail)
    peacock_in.save
    session[:id] = peacock_in.id
    redirect to "/register/#{user_am}"
  elsif log_nil?(user_am,user_mail,user_pk,user_pass) && exist?(user_mail)
    redirect to '/user_exist'
  else
    redirect to '/nil'#mejor redireccionalo al registro
  end
end

get '/register/:iam' do
  iam = params[:iam]
  erb :"#{iam}"
end

post '/register/info' do
  enter_id = session[:id]
  name_ent = params[:name_ent]
  pk_id = params[:pk_id]
  ceo_ent = params[:ceo_ent]
  country = params[:country]
  state = params[:state]
  street = params[:street]
  n_int = params[:n_int]
  n_ext = params[:n_ext]
  page = params[:page]
  type = params[:type]
  description = params[:description]
  Info.create(enterprise_id: enter_id, name_ent: name_ent, pk_id: pk_id, ceo_ent: ceo_ent,
      country: country, state: state, street: street, n_int: n_int,
      n_ext: n_ext, page: page, type: type, description: description )
  redirect to '/secret/Enterprise'
end

post '/register/info_per' do
  user_id = session[:id]
  name_per = params[:name_per]
  lname_per = params[:lname_per]
  born = params[:born]
  ocupation = params[:ocupation]
  soc_stat = params[:soc_stat]
  pk_id = params[:pk_id]
  country = params[:country]
  state = params[:state]
  street = params[:street]
  n_int = params[:n_int]
  n_ext = params[:n_ext]
  page = params[:page]
  description = params[:description]
  Infoper.create(user_id: user_id, name_per: name_per, lname_per: lname_per, born: born, ocupation: ocupation, 
      soc_stat: soc_stat, pk_id: pk_id, country: country, state: state, 
      street: street, n_int: n_int, n_ext: n_ext, page: page, description: description )
  redirect to '/secret/User'
end

post '/login' do
  
  email_access = params[:id_user_access]
  password_access = params[:password_user_access]
#buscar si existe el usuario

  user_authenticate = User.authenticate(email_access, password_access)
  user_authenticate ||= Enterprise.authenticate(email_access, password_access)

  if user_authenticate
    session[:id] = user_authenticate.id
    session[:email] = user_authenticate.mail

    redirect to "/secret/#{user_authenticate.class} "
  else
    redirect to '/'
  end

end

get '/logout' do
  session.clear
  @exit = true
  erb :principal
end
