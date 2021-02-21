Rails.application.routes.draw do
  resources :enrollments
  devise_for :users
  resources :courses do
    resources :lessons
  end
  
  resources :users, only: [:index, :edit, :show, :update]
  get 'static_pages/activity'
      
  root 'static_pages#landing_page'
  
  resources :people do
  collection do
    match 'search' => 'people#search', via: [:get, :post], as: :search
    end
  end
  
  
  get 'privacy_policy', to: 'static_pages#privacy_policy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
