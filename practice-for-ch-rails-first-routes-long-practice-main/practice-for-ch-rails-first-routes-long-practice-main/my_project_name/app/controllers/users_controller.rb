require "byebug"
class UsersController < ApplicationController
  def index
    # debugger
    users = User.all
    render json: users
  end

  def create
    user = User.new(user_param)
    if user.save
      redirect_to users_url(user.id)
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
    # render json: user
  end

  def show
    incoming_wildcard = params[:id]
    user = User.find_by(id: incoming_wildcard)
    if user
      render json: user
    else
      render json: user.errors.full_messages, status: 404
    end
  end

  def update
    incoming_wildcard = params[:id]
    user = User.find_by(id: incoming_wildcard)
    if user && user.update(user_param)
      redirect_to users_url
    else
      render json: user.errors.full_messages, status: 422
    end
  end

  def destroy
    incoming_wildcard = params[:id]
    user = User.find_by(id: incoming_wildcard)
    if user && user.destroy
      redirect_to users_url
    else
      render json: user.errors.full_messages, status: 422
    end
  end

  private
  def user_param
    params.require(:user).permit(:name, :email)
  end
end
