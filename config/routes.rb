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

# 先生用

scope module: :public do
	root to: "homes#top"
end

scope module: :public do
  resources :items,only: [:index,:show] do
   resource :bookmarks, only: [:create, :destroy]
  get "searches"=>"items#searches"
  get "search_word" => "items#search_word"
  end
end

scope module: :public do
  get "teachers/my_page" => "teachers#show"
  get 'teachers/information/edit' => 'teachers#edit'
  patch "teachers/information" => "teachers#update"
  patch "teahers/delete_status"=>"teachers#is_deleted",as:"is_deleted"
end

scope module: :public do
  resources:utilizations,only: [:new,:create,:index]
  post "utilizations/confirm"=>"utilizations#confirm",as:"confirm"
  get "utilizations/complete"=>"utilizations#complete",as:"complete"
  get "utilizations/:id"=>"utilizations#show",as:"utilization"
end


# 管理者用
namespace :admin do
  root to: "homes#top"

  resources :items

  resources :genres,only: [:index,:create,:edit,:update]

  resources :teachers,only: [:index,:show,:edit,:update]

  resources :utilizations,only: [:show]

end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
