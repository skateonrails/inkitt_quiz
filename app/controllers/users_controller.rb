class UsersController < ApplicationController
  def index
    @user = User.new
  end

  def create
    @user = User.new(user_attributes)

    if @user.valid?
      @user.save!
    else
      flash[:error] = @user.errors.full_messages.first
    end


    redirect_to root_path
  end

  private

  def user_attributes
    params.require(:user).permit(:email, :fingerprint_hash)
  end
end
