Rtdash::Application.routes.draw do

  resources :users
  resources :sessions, :only => [:new, :create, :destroy]

  #resources :blog
  match '/blog',                  :to => 'blog#index'
  match "/blog/:id",              :to => 'blog#show'
  match '/blog/previous/:offset', :to => 'blog#previous'
  match '/blog/next/:offset',     :to => 'blog#next'

  # TODO: this is a temp route until the final arq is figured out.
  match '/chat/message',        :to => 'chat#message'

  match '/signup',              :to => 'users#new'
  match '/login',               :to => 'sessions#new'
  match '/logout',              :to => 'sessions#destroy'

  match '/home',                :to => 'pages#home'
  match '/features',            :to => 'pages#features'
  match '/how_does_it_work',    :to => 'pages#how_does_it_work'
  match '/price',               :to => 'pages#price'
  match '/support',             :to => 'pages#support'
  match '/press',               :to => 'pages#press'
  match '/company',             :to => 'pages#company'

  root                          :to => 'pages#home'
end
