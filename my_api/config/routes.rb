Rails.application.routes.draw do
  #resources :users
  post '/users/create', to: 'users#my_create' #增加

  post '/users/delete/:id', to: 'users#my_delete'  #删除

  post '/users/update/:id', to:'users#my_update' #修改

  get '/users/retrieveall', to:'users#my_retrieveall' #查找所有

  get '/users/retrieve/:id', to:'users#my_retrieve' #查找

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
