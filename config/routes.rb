Rails.application.routes.draw do
  resources :comments
  resources :posts do
  	member do
		put "like", to:    "posts#upvote"
		put "dislike", to: "posts#downvote"
	  end
	end
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
	
	post '/:team_id/posts_list' => 'posts#index', as: 'post_list'
	get '/:team_id/posts_list' => 'posts#index', as: 'get_post_list'
	
	post '/:team_id/posts' => 'posts#new', as: 'write_post'
	get '/:team_id/posts' => 'posts#new', as: 'get_write_post'
	
	post '/:team_id/activities/:id' => 'activities#edit', as: 'edit_activity_'
	get '/:team_id/activities/:id' => 'activities#edit', as: 'get_edit_activity'
	
	post '/:team_id/posts/:id' => 'posts#edit', as: 'edit_post_'
	get '/:team_id/posts/:id' => 'posts#edit', as: 'get_edit_post'
end
