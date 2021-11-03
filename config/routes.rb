Rails.application.routes.draw do
  devise_for :customers, controllers: {
    sessions: 'pubilc/sessions',
    passwords: 'public/passwords',
    registrations: 'public/registrations'
  }
  devise_for :admin, controllers: {
    sessions: 'admin/sessions',
    passwords: 'admin/passwords',
    registrations: 'admin/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
