#== Route Map
# Generated on 23 Jun 2012 19:14
#
#                  POST   /users(.:format)                 users#create
#         new_user GET    /users/new(.:format)             users#new
#        edit_user GET    /users/:id/edit(.:format)        users#edit
#             user GET    /users/:id(.:format)             users#show
#                  PUT    /users/:id(.:format)             users#update
#                  DELETE /users/:id(.:format)             users#destroy
#         sessions POST   /sessions(.:format)              sessions#create
#      new_session GET    /sessions/new(.:format)          sessions#new
#          session DELETE /sessions/:id(.:format)          sessions#destroy
#             blog        /blog(.:format)                  blog#index
#                         /blog/:id(.:format)              blog#show
#                         /blog/previous/:offset(.:format) blog#previous
#                         /blog/next/:offset(.:format)     blog#next
#     chat_message        /chat/message(.:format)          chat#message
#           signup        /signup(.:format)                users#new
#            login        /login(.:format)                 sessions#new
#           logout        /logout(.:format)                sessions#destroy
#             home        /home(.:format)                  pages#home
#         features        /features(.:format)              pages#features
# how_does_it_work        /how_does_it_work(.:format)      pages#how_does_it_work
#            price        /price(.:format)                 pages#price
#          support        /support(.:format)               pages#support
#            press        /press(.:format)                 pages#press
#          company        /company(.:format)               pages#company
#             root        /                                pages#home
#
Rtdash::Application.routes.draw do

  resources :users
  resources :sessions, :only => [:new, :create, :destroy]

  # TODO: this is a temp route until the final arq is figured out.
  get '/chat/message',        :to => 'chat#message'

  get '/signup',              :to => 'users#new'
  get '/login',               :to => 'sessions#new'
  match '/logout',            :to => 'sessions#destroy', via: [:get, :delete]

  get '/home',                :to => 'pages#home'
  get '/features',            :to => 'pages#features'
  get '/how_does_it_work',    :to => 'pages#how_does_it_work'
  get '/price',               :to => 'pages#price'
  get '/support',             :to => 'pages#support'
  get '/press',               :to => 'pages#press'
  get '/company',             :to => 'pages#company'

  #resources :blog
  get '/blog',                              :to => 'blog#index'
  get "/blog/:id",                          :to => 'blog#show'
  get '/blog/:year/:month/:day/:url',       :to => 'blog#show_by_url'
  get '/blog/previous/:offset',             :to => 'blog#previous'
  get '/blog/next/:offset',                 :to => 'blog#next'

  root                          :to => 'pages#home'
end
