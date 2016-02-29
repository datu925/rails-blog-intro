class RegisterUser
  attr_reader :params
  def initialize(params)
    @params = params
  end

  def register
    case params[:role]
    when "mentor"
      user = User.new({
        name: params[:name],
        years_experience: params[:years_experience],
        })
    when "student"
      user = User.new({
        name: params[:name],
        grade_level: params[:grade_level],
        })
    end
    if user.save
      return user
    else
      return false # or more detailed errors object
    end
  end
end

# def register
#   registrar = RegisterUser.new(params)
#   if user = registrar.register
#     session[:user_id] = user.id
#     redirect_to "index"
#   else
#     #blah blah errors
#     redirect_to "register"
#   end
# end