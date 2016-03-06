class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception
  ActionController::Parameters.permit_all_parameters = true
  before_action :set_user, only: [:users, :save, :get, :delete]

  def create
    params.delete 'submit'
    params.delete 'controller'
    params.delete 'action'
    @user = User.create(params)
    redirect_to "/users/#{@user.id}"
  end

  def signin
    params.delete 'controller'
    params.delete 'action'
    params.delete 'submit'
    params.delete 'id'
    @user = User.find_by(params)
    if @user
      redirect_to "/users/#{@user.id}"
    else
      redirect_to root_path
    end
  end

  def save
    File.open('./public/marshal_dump', 'w') { |file| file.write @user.to_json }

  end

  private
  def set_user
    @user = User.find(params[:id])
  end

end
