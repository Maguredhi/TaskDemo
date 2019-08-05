Rails.application.routes.draw do
  root 'tasks#index'

  scope "(:locale)" do
    resources :tasks
  end
end