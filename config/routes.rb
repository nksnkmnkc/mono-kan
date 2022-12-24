Rails.application.routes.draw do
  # 先生用
  # URL /teachers/sign_in ...
  devise_for :teachers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  #ゲストログイン
  devise_scope :teacher do
    post 'teachers/guest_sign_in', to: 'teachers/sessions#guest_sign_in'
  end


  # 先生用
  #scope moduleでurlにpublicと付ける必要がなくなる

  scope module: :public do
    root to: "homes#top"
    get "items/searches/:genre_id",to: "items#searches",as:"item_searches"
    resources :items,only: [:index,:show] do
      resource :favorites, only: [:create, :destroy]
      collection do
        get "search_word" => "items#search_word"
      end
    end

    get "teachers/my_page",to: "teachers#show"
    get 'teachers/information/edit',to: 'teachers#edit'
    patch "teachers/information",to: "teachers#update"
    patch "teahers/delete_status",to: "teachers#is_deleted",as:"is_deleted"

    resources:utilizations,only: [:new,:create,:index]
    post "utilizations/confirm",to: "utilizations#confirm",as:"confirm"
    get "utilizations/complete",to: "utilizations#complete",as:"complete"
    get "utilizations/:id",to: "utilizations#show",as:"utilization"
  end

  # 管理者用
  namespace :admin do
    root to: "homes#top"

    resources :items

    resources :genres,only: [:index,:create,:edit,:update]

    resources :teachers,only: [:index,:show,:edit,:update]


  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
