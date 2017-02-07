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
