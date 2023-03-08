require "byebug"
class UsersController < ApplicationController
  def index
    # debugger
    render plain: "I'm in the index action"
  end

  def create 
    render json: params
  end

  def show 
    render json: params
  end
end
