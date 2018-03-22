Rails.application.routes.draw do
  root 'tests#index'

  get :sign_up, to: 'users#new'
  get :sign_in, to: 'sessions#new'
  delete :sign_out, to: 'sessions#destroy'

  resources :users, only: :create
  resources :sessions, only: :create

  resources :tests do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, except: :index
    end

    post :start, on: :member
  end

  resources :test_passages, only: %i[show update] do
    get :result, on: :member
  end
end
