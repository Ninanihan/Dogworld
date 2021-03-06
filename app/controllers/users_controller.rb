class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update,
                                        :following, :followers]
  before_action :correct_user,   only: [:edit, :update]


  def index
    @users = User.paginate(page: params[:page], :per_page => 5)
  end

  def show
        @user = User.find(params[:id])
        @microposts = @user.microposts.paginate(page: params[:page])
  end

  def new
    @user = User.new
  end
       
  def create
        secure_params = params.require(:user).permit(:name, :email, 
                                  :password, :password_confirmation)
        
        @user = User.new(secure_params)
        if @user.save
          remember @user
        	flash[:success] = "Welcome to the Pet World App!"
          redirect_to @user
        else
          render 'new'     
        end
  end

  def edit
    
  end

  def update
    
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
  

   
end
