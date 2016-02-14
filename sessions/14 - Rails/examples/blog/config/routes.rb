require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :authors, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  resources :posts, only: [:index, :show] do
    resources :comments
  end
  get 'contacts' => 'static_pages#contacts'
  get 'some_long_task_strait' => 'static_pages#some_long_task_strait'
  get 'some_long_task_sidekiq' => 'static_pages#some_long_task_sidekiq'
  get 'result' => 'static_pages#result'

  root 'posts#index'

  mount Sidekiq::Web => '/sidekiq'
end
