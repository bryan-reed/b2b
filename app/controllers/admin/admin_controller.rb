class Admin::AdminController < ApplicationController
    before_action :require_admin_user
    def index
        
    end
end
