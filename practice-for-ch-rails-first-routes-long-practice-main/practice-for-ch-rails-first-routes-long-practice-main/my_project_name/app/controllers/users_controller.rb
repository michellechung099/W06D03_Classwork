require "byebug"
class UsersController < ApplicationController
  def index
    # debugger
    name = params[:search]
    user = User.where("username ILIKE '#{name}'")
    if user.empty?
      render json: user
    else
      users = User.all
      render json: users
    end
    # search = params[:search]
   
  end

  def create
    user = User.new(user_params)
    if user.save
      # redirect_to users_url(user.id) 
      render json: user, status: :created #201
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
      # render json: "user does not exist"
      redirect_to users_url
    end
  end

  def update
    incoming_wildcard = params[:id]
    user = User.find_by(id: incoming_wildcard)
    if user && user.update(user_params)
      redirect_to users_url
    else
      render json: user.errors.full_messages, status: 422
    end
  end

  def destroy
    incoming_wildcard = params[:id]
    user = User.find_by(id: incoming_wildcard)
    if user && user.destroy
      # redirect_to users_url
      render json: user
    else
      render json: user.errors.full_messages, status: 422
    end
  end

  private
  def user_params
    params.require(:user).permit(:username)
  end
end
