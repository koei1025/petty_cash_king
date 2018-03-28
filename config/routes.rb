Rails.application.routes.draw do
  root 'home#index'
  resources :lookup_sorts do
    resources :lookups
  end
  resources :job_defines, except: :show do
    resources :job_parameters
  end
end
