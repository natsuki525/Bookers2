Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
  	root :to => "home#top"
  end
  #get '/' => 'home#top'
  get '/home/about' => 'home#about'
  #root 'home#top'
  resources :books, only: [:new, :create, :index, :show, :destroy, :edit, :update]
  resources :users, only: [:show, :edit, :update, :index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
