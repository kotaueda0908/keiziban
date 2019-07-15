class ApplicationController < ActionController::Base
  before_action :authenticate_user!, {only: [:index, :show, :edit, :update]}
end
