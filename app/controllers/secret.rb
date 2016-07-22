get '/secret/User' do #ya
  current_user
  erb :secret
end

get '/secret/Enterprise' do #ya
  current_enterprise
  erb :secret_enterprise
end

post '/add_employee' do #necesita ajax
  pk_mail = params[:pk_employee]
  job = params[:job]

  employee = User.find_by(pk_id: pk_mail)
  employee ||= User.find_by(mail: pk_mail)

  rela = Relation.create(sudo: session[:id], enterprise_id: session[:id], 
        user_id: employee.id, evaluate: job) 
  #hacer un metodo de validacion para el sudo
  redirect to '/secret/Enterprise'
end

get '/employee/:relation_id/info' do #ya
  @relation_id = params[:relation_id]
  erb :wall
end

before '' do
  relation_id = params[:relation_id]
  relation = Relation.find(relation_id)
  if session[:id] == relation.enterprise_id
    @relation_id = params[:relation_id]
    erb 
  else
    @no_peack = "You can't Peack this"
    erb :wall
  end
end

get '/reputation/:rela_reputation' do #ya
  path = params[:rela_reputation]
  path_ary = path.split("_")
  @relation_id = path_ary[0] #relation_id
  @reputation_id = path_ary[1] #reputation_id
  erb :evaluation
end
  
post '/evaluation' do
  path = params[:rela_reputation]
  path_ary = path.split("_")
  @relation_id = path_ary[0] #relation_id
  @reputation_id = path_ary[1] #reputation_id

  puntuality = params[:puntuality]
  performance = params[:performance]
  per_img = params[:per_img]

  puntuality_com = params[:puntuality_com]
  performance_com = params[:performance_com]
  per_img_com = params[:per_img_com]

  Repute.create(reputation_id: @reputation_id, relation_id: @relation_id, stars: puntuality, commit: puntuality_com) 
  Repute.create(reputation_id: @reputation_id, relation_id: @relation_id, stars: performance, commit: performance_com)
  Repute.create(reputation_id: @reputation_id, relation_id: @relation_id, stars: per_img, commit: per_img_com)

  redirect to '/secret/Enterprise'
end

post '/add_reputation' do #ya
  reputation_kind = params[:reputation_kind]
  description = params[:description]
  clase = login_find(session[:email])
  if "#{clase.class}"=="User"
    Reputation.create(user_id: session[:id], ocupation: reputation_kind, description: description )
  elsif "#{clase.class}"=="Enterprise"
    Reputation.create(enterprise_id: session[:id], ocupation: reputation_kind, description: description )
  end  
  #Me gustaria que fuera un Ajax
  redirect to "/secret/#{clase.class}"
end

get'/reputation/:reputation_id/reputes' do
  #en esta direccion se pretende mostrar todos los reputes
end
