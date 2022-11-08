Rails.application.routes.draw do

  # get 'students/create'
  # get 'students/show'
  # patch 'students/update'
  # destroy 'students/destroy'
  resources :instructors, except: [:new]


  resources :students, except: [:new]


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
