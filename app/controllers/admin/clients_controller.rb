class Admin::ClientsController < ApplicationController
    before_action :require_admin_user
    layout "admin/admin"
    def index
        @clients = Client.all
    end
    def new
        @client = Client.new
    end
end
