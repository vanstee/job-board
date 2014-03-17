JobBoard::Application.routes.draw do
  use_doorkeeper
  devise_for :users, skip: :all

  defaults format: :json do
    resources :jobs, only: [:index, :create, :show]
  end

  defaults format: :html do
    match '(*_)' => 'application#index', via: :all
  end
end
