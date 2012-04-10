Rtdash::Application.routes.draw do

  resources :users
  resources :sessions, :only => [:new, :create, :destroy]

  # TODO: this is a temp route until the final arq is figured out.
  match '/chat/message',        :to => 'chat#message'

  match '/signup',              :to => 'users#new'
  match '/login',               :to => 'sessions#new'
  match '/logout',              :to => 'sessions#destroy'

  match '/home',                :to => 'pages#home'
  match '/features',            :to => 'pages#features'
  match '/how_does_it_work',    :to => 'pages#how_does_it_work'
  match '/price',               :to => 'pages#price'
  match '/blog',                :to => 'pages#blog'
  match '/support',             :to => 'pages#support'
  match '/press',               :to => 'pages#press'
  match '/company',             :to => 'pages#company'

  root                          :to => 'pages#home'
end
