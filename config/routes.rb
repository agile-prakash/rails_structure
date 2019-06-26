Rails.application.routes.draw do  	 	
	root 'homes#index'
	get 'home', to: 'homes#index'
	resources :users do
		get 'profile', on: :collection
	end
	resources :sessions do 
		post 'user_login', 	   on: :collection
		post 'user_register',  on: :collection
	end	
	get 'signup', to: 'sessions#register', as: 'signup'
	get 'login', to: 'sessions#new', as: 'login'
	get 'logout', to: 'sessions#destroy', as: 'logout'		
end
