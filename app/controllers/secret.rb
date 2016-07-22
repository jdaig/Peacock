get '/secret/User' do
  current_user
  erb :secret
end

get '/secret/Enterprise' do
  current_enterprise
  erb :secret_enterprise
end

post '/add_employee' do
  pk_mail = params[:pk_employee]
  job = params[:job]

  employee = User.find_by(pk_id: pk_mail)
  employee ||= User.find_by(mail: pk_mail)

  rela = Relation.create(sudo: session[:id], enterprise_id: session[:id], 
        user_id: employee.id, evaluate: job)
  redirect to '/secret/Enterprise'#Me gustaria que fuera un Ajax
end

get '/employee/:relation_id/info' do
  @relation_id = params[:relation_id]
  erb :wall
end

get '/reputation/:p_r' do
  path = params[:p_r]
  path_ary = path.split("-")
  @path_pid = path_ary[0]
  @path_rid = path_ary[1]
  current_enterprise
  @current_user.relation
  erb :evaluation
end
  
post '/evaluation/:p_r' do
  path = params[:p_r]
  path_ary = path.split("-")
  @path_pid = path_ary[0]
  @path_rid = path_ary[1]

  puntuality = params[:puntuality]
  performance = params[:p_r]
  per_img = params[:per_img]

  puntuality_com = params[:puntuality_com]
  performance_com = params[:performance_com]
  per_img_com = params[:per_img_com]

  Repute.create(reputation_id: @path_rid, stars: puntuality, commit: puntuality_com) 
  Repute.create(reputation_id: @path_rid, stars: performance, commit: performance_com)
  Repute.create(reputation_id: @path_rid, stars: per_img, commit: per_img_com)

end

