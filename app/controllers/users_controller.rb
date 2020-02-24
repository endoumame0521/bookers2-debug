class UsersController < ApplicationController
	before_action :baria_user, only: [:edit, :update]
  before_action :set_user, only: [:show, :edit, :update, :following, :followers]

  def show
  	@books = @user.books
  end

  def index
    @users = User.search(user_search_params)
  	@book = Book.new #new bookの新規投稿で必要（保存処理はbookコントローラー側で実施）
  end

  def edit
  end

  def update
  	if @user.update(user_params)
  		redirect_to @user, notice: "successfully updated user!"
  	else
  		render "edit"
  	end
  end

  def following
    @users = @user.following
  end

  def followers
    @users = @user.followers
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
  	params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def user_search_params
    params.fetch(:search, {}).permit(:method, :word)
  end

  #url直接防止　メソッドを自己定義してbefore_actionで発動。
   def baria_user
  	unless params[:id].to_i == current_user.id
  		redirect_to user_path(current_user)
  	end
   end

end
