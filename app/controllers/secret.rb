get '/secret/User' do
  erb :secret
end

get '/secret/Enterprise' do
  current_enterprise
  erb :secret_enterprise
end

post '/add_employee' do
  pk_mail = params[:pk_employee]

  employee = User.find_by(pk_id: pk_mail)
  employee ||= User.find_by(mail: pk_mail)

  rela = Relation.create(sudo: session[:id], enterprise_id: session[:id], user_id: employee.id)


end

get '/employee/:employee_id' do
  @employee_id = params[:employee_id]
  erb :wall
end