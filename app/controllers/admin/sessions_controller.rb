class Admin::SessionsController < ApplicationController
  # before_action :require_user, except: [:index, :show]
  layout "admin/login"
  before_action :require_admin_user, except: [:login, :create]
  def login
    # session[:admin_id] = nil
    # flash[:success] = "You have logged out"
    # redirect_to root_path
  end
  def create
    adminUser = Admin.find_by(email: params[:session][:email].downcase)
        if adminUser && adminUser.authenticate(params[:session][:password])
            session[:admin_id] = adminUser.id
            flash[:success] = "Successfully logged in"
            redirect_to admin_mao_path
        else
            flash.now[:danger] = "There was an issue with your login"
            render 'login'
        end
  end
end
