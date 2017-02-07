get '/restaurants/new' do
  require_user
  erb :'restaurants/new'
end

post '/restaurants' do
  @restaurant = current_user.restaurants.new(params[:restaurant])
  if @restaurant.save
    redirect "/restaurants/#{@restaurant.id}"
  else
    @errors = @restaurant.errors.full_messages
    erb :'restaurants/new'
  end
end

get '/restaurants/:id' do
  @restaurant = Restaurant.find_by(id: params[:id])
  erb :'restaurants/show'
end

get '/restaurants/:id/edit' do
  require_user
  @restaurant = Restaurant.find_by(id: params[:id])
  erb :'/restaurants/edit'
end

put '/restaurants/:id' do
  @restaurant = Restaurant.find(params[:id]).update(params[:restaurant])
  redirect '/'
end

delete '/restaurants/:id' do
  @restaurant = Restaurant.find(params[:id]).delete
  redirect '/'
end
