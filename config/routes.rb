Rails.application.routes.draw do
  resources :school 
  post 'students', to: 'students#create'
  delete 'students/user_id', to: 'students#delete'
end
