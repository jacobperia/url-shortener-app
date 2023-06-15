Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'dashboard#index'
  post '/', to: 'dashboard#create', as: 'new_short_link'
  get '/:token', to: 'dashboard#redirect', as: 'redirect'
  get '/:token/info', to: 'dashboard#info', as: 'info'
end
