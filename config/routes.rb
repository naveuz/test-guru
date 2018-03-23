Rails.application.routes.draw do
  root 'tests#index'

  devise_for :users, path_names: { sign_in: 'login', sign_out: 'logout' }

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
