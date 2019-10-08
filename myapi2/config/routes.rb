Rails.application.routes.draw do
  post '/books/create', to: 'books#my_create' #增加

  post '/books/delete/:id', to: 'books#my_delete'  #删除

  post '/books/update/:id', to:'books#my_update' #修改

  get '/books/retrieveall', to:'books#my_retrieveall' #查找所有

  get '/books/retrieve/:id', to:'books#my_retrieve' #查找

  get '/books/download/:filename',to:'books#my_down_file'#下载

  post '/books/upload_CarrierWave',to:'books#my_up_file_CarrierWave'#上传_CarrierWave

  post '/books/my_up_file_CarrierWave_with_Books',to:'books#my_up_file_CarrierWave_with_Books'#上传_CarrierWave_关联Model

  get '/books/my_down_file_CarrierWave_with_Books/:id',to:'books#my_down_file_CarrierWave_with_Books'#下载_CarrierWave_关联Model

  get '/books/test_sidekiq/:count', to:'books#sidekiq_only_job'
 
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq' #sidekiq前端
end
