Rails.application.routes.draw do
  devise_for :customers, skip: [:passwords], controllers:{
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  devise_for :admins, skip: [:registrations,:passwords], controllers:{
    sessions: "admin/sessions"
  }

  scope module: :public do
    root to: 'homes#top'
    get "about"=>"homes#about"
    resources :items, only: [:index,:show]
    resource :customers, only: [] do
      member do
        get :my_page, action: :show
        get 'information/edit', action: :edit
        patch :information, action: :update
        get :confirm
        patch :withdraw
      end
    end
    resources :cart_items, except: [:new,:show,:edit] do
      collection do
        delete :all_destroy
      end
    end
    resources :orders, except: [:edit,:update,:destroy] do
      collection do
        post :confirm
        get :complete
      end
    end
    resources :shipping_addresses, except: [:new,:show]
  end

  namespace :admin do
    root to: 'homes#top'
    resources :items, except: [:destroy]
    resources :genres, except: [:new,:show,:destroy]
    resources :customers, except: [:new,:create,:destroy]
    resources :orders, only: [:show,:update]
    resources :order_details, only: [:update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
