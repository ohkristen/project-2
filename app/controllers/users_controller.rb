class UsersController < ApplicationController
  # before_action :logged_in_user, only: [:index, :edit, :update]

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
    @enrollments = Enrollment.where("user_id = ?", current_user.id)
    @enrolled_in = []
    @enrollments.each do |e|
      @enrolled_in.push e.article_id
    @comments = @user.comments.paginate(page: params[:page])
    end
    @articles = Article.find_by_id(@enrolled_in)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Learning List"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
