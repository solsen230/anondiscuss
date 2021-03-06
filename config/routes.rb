Anondiscuss::Application.routes.draw do
  devise_for :users

  resources :posts do
    resources :comments, :only => [:create, :destroy, :new]
    member do
      put :softdelete
    end
  end

  root :to => "posts#index"

  match '/help',    to: 'static_pages#help'
  match '/about',   to: 'static_pages#about'
  match 'donate' => 'static_pages#donate'
end
