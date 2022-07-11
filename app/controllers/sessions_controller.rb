class SessionsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :catch_not_found
  skip_before_action :authorized, only: [:new, :create, :welcome, :user]
  def new
  end

  def login
  end

  def create
    @user = User.find_by(name: params[:name])
    if @user && @user.authenticate(params[:password])
        sessions[:user_id] = @user.id
        redirect_to '/user'
    else
        redirect_to '/login'
    end
  end

  def page_requires_login
  end

  def catch_not_found(e)
      Rails.logger.debug("We had a not found exception.")
      flash.alert = e.to_s
      redirect_to orders_path
    end
end
