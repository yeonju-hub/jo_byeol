Rails.application.routes.draw do
  resources :activities
  resources :meetings
  get 'home/index'
  resources :uhts
  resources :admins
  resources :teams
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
	
	root 'home#index'
	
	get '/teams/:team_id/admin_connect' => 'teams#admin_connect', as: 'admin_connect'
	
	post '/:team_id/activities_list' => 'activities#index', as: 'activity_list'
	get '/:team_id/activities_list' => 'activities#index', as: 'get_activity_list'
	
	post '/:team_id/activities' => 'activities#new', as: 'write_activity'
	get '/:team_id/activities' => 'activities#new', as: 'get_write_activity'
	
	post '/:team_id/meetings' => 'meetings#new', as: 'write_meeting'
	get '/:team_id/meetings' => 'meetings#new', as: 'get_write_meeting'
	
	post '/:team_id/members' => 'uhts#index', as: 'members'
	get '/:team_id/members' => 'uhts#index', as: 'get_members'
end
