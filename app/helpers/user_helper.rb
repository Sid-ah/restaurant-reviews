def current_user
  @current_user ||= User.find_by(id: session[:user_id])
end

def require_user
  redirect "/" unless current_user
end

def authorized?(thing_id)
  current_user.id == thing_id
end
