class ClientSite
	def self.matches?(request)
      request.subdomain.present? && request.subdomain != 'www'
    end
end
Rails.application.routes.draw do
  namespace :admin do
    get 'sessions/login'
  end

	constraints ClientSite do
	  get '/', to: 'client#home'
	  get '/login', to: 'client#login'
	  post '/login', to: 'client#create'
	  get '/admin', to: 'client#login'
	end
	# get '/login', to: ''
	# Client admin
	# get '/admin', to: 'client#admin', constraints: lambda { |r| r.subdomain.present? && r.subdomain != 'www' }
	# Client front end
	# get '/', to: 'client#home', constraints: lambda { |r| r.subdomain.present? && r.subdomain != 'www' }
	# MAO Admin
	namespace :admin do
		get '/', to: 'admin#index', as: 'mao'
		get '/login', to: 'sessions#login'
		post '/login', to: 'sessions#create'
		get '/users', to: 'users#index'
		get '/clients', to: 'clients#index'
		get '/clients/new', to: 'clients#new'
		post '/clients/new', to: 'clients#create', as: 'add_client'
	end

	root 'static_pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
