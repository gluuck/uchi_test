Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :school do
        resources :class_rooms do
          resource :students, only: :show
        end
      end
      post 'students', to: 'students#create'
      delete 'students/user_id', to: 'students#destroy'
    end
  end
end
