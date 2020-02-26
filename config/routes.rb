Rails.application.routes.draw do

  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
  }


  resources :users, only: [:show, :index, :edit, :update] do
    get :following, on: :member
    get :followers, on: :member
  end

  resources :relationships, only: [:create, :destroy]

  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end

  get 'home/about' => 'home#about'
  get 'home/top' => 'home#top'

  root 'home#top'

end