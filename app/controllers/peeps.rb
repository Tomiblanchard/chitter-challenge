post '/peeps' do
  @peep = peep.create
  if @peep.save
    redirect to('/')
  else
    flash.now[:errors] = @peep.errors.full_messages
    erb :peep
  end
end

get '/sessions/peep' do
  erb :peep
end
