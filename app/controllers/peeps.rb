post '/peeps' do
  message = params["message"]
  user = params["user"]
  Peep.create(:message => message, :user => current_user.name)
  redirect to('/')
end
