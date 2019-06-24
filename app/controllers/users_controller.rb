class UsersController < ApplicationController
  def index
  end

  def show
    @user = Hash.new
    @user[:name] = 'Soushi Yamamoto'
    @user[:username] = 'soushiy'
    @user[:location] = 'Tokyo, Japan'
    @user[:about] = 'Hello.'
  end
end
