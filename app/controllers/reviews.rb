post '/reviews' do
  @restaurant = Restaurant.find(params[:restaurant_id])
  @review = @restaurant.reviews.new(params[:review])
  if @review.save
    redirect "/restaurants/#{@restaurant.id}"
  else
    @errors = @review.errors.full_messages
    erb :'restaurants/show'
  end
end

post '/reviews/login' do
  @restaurant = Restaurant.find(params[:restaurant_id])
  @user = User.find_by(email: params[:user][:email])
  @reviews = @restaurant.reviews
  if @user &&  @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    redirect "/restaurants/#{@restaurant.id}"
  else
    @errors= ['Invalid username/password']
    erb :'restaurants/show'
  end
end
