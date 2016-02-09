Rails.application.routes.draw do
  devise_for :authors, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  resources :posts, only: [:index, :show] do
    resources :comments
  end
  get 'contacts' => 'static_pages#contacts'

  root 'posts#index'
end
