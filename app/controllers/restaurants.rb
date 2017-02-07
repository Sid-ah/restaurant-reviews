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
