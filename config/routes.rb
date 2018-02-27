Rails.application.routes.draw do

	root "listings#index"
  resources :listings do
    resources :reservations
  end

  get 'payment/:reservation_id/new' => "payments#new", as:"new_payment"
  post 'payment/:reservation_id/checkout' => "payments#checkout", as: "check_out"

  
	get "/auth/:provider/callback" => "sessions#create_from_omniauth"  	
  get "/users/settings/" => "users#settings"
  get "/users/settings/:user_id" => "users#edit_setting", as:"edit_user_setting"
  put "/users/settings/:user_id" => "users#update_setting"
 
	
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, only: [:create, :edit, :update] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]

  end
  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  get "/reservation/itinerary" => "reservations#itinerary", as:"itinerary"
	
end
