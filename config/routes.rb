Rails.application.routes.draw do
  devise_for :users, controllers: {
  sessions:      'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations'
  }

  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
  }
  
  get 'admins/user_index'
  
  get 'search', to: 'search#index', as: :search_index

  get 'calculations/input'

  get 'calculations/output'

  post 'calculations/output' => 'calculations#output', as: 'calc_out'

  root to: 'cars#top'

  get '/cars/top', to:'cars#top'
  get '/users/:id/carlist' => 'users#carlist', as: 'carlist'
  get '/users/:id/bloglist' => 'users#bloglist', as: 'bloglist'
  get '/users/:id/notelist' => 'users#notelist', as: 'notelist'
  resources :cars

  resources :blogs do
    resource :blog_comments, only: [:create, :update, :destroy]
  end

  resources :notes do
    resource :note_comments, only: [:create, :update, :destroy]
    resource :clips, only: [:create, :destroy]
  end

  resources :clips, only: [:index]

  resources :users
  # resourcesは最後の方に書く

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
