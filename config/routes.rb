Rails.application.routes.draw do
  
  devise_for :users
  
  get  'presences/index'
  get  'presences/new'
  post 'presences/new' => 'presences#create'
  get  'presences/edit'
  post 'presences/edit' => 'presences#update'
  get  'presences/show'
  get  'presences/destroy'

  get 'home/index'

  resources :students

  resources :subjects

  resources :courses

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  root 'home#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
=begin
Helper  HTTP Verb Path  Controller#Action
Path / Url      
new_user_session_path GET /users/sign_in(.:format)  devise/sessions#new
user_session_path POST  /users/sign_in(.:format)  devise/sessions#create
destroy_user_session_path DELETE  /users/sign_out(.:format) devise/sessions#destroy
user_password_path  POST  /users/password(.:format) devise/passwords#create
new_user_password_path  GET /users/password/new(.:format) devise/passwords#new
edit_user_password_path GET /users/password/edit(.:format)  devise/passwords#edit
PATCH /users/password(.:format) devise/passwords#update
PUT /users/password(.:format) devise/passwords#update
cancel_user_registration_path GET /users/cancel(.:format) devise/registrations#cancel
user_registration_path  POST  /users(.:format)  devise/registrations#create
new_user_registration_path  GET /users/sign_up(.:format)  devise/registrations#new
edit_user_registration_path GET /users/edit(.:format) devise/registrations#edit
PATCH /users(.:format)  devise/registrations#update
PUT /users(.:format)  devise/registrations#update
DELETE  /users(.:format)  devise/registrations#destroy
presences_index_path  GET /presences/index(.:format)  presences#index
presences_new_path  GET /presences/new(.:format)  presences#new
POST  /presences/new(.:format)  presences#create
presences_edit_path GET /presences/edit(.:format) presences#edit
POST  /presences/edit(.:format) presences#update
presences_show_path GET /presences/show(.:format) presences#show
presences_destroy_path  GET /presences/destroy(.:format)  presences#destroy
home_index_path GET /home/index(.:format) home#index
students_path GET /students(.:format) students#index
POST  /students(.:format) students#create
new_student_path  GET /students/new(.:format) students#new
edit_student_path GET /students/:id/edit(.:format)  students#edit
student_path  GET /students/:id(.:format) students#show
PATCH /students/:id(.:format) students#update
PUT /students/:id(.:format) students#update
DELETE  /students/:id(.:format) students#destroy
subjects_path GET /subjects(.:format) subjects#index
POST  /subjects(.:format) subjects#create
new_subject_path  GET /subjects/new(.:format) subjects#new
edit_subject_path GET /subjects/:id/edit(.:format)  subjects#edit
subject_path  GET /subjects/:id(.:format) subjects#show
PATCH /subjects/:id(.:format) subjects#update
PUT /subjects/:id(.:format) subjects#update
DELETE  /subjects/:id(.:format) subjects#destroy
courses_path  GET /courses(.:format)  courses#index
POST  /courses(.:format)  courses#create
new_course_path GET /courses/new(.:format)  courses#new
edit_course_path  GET /courses/:id/edit(.:format) courses#edit
course_path GET /courses/:id(.:format)  courses#show
PATCH /courses/:id(.:format)  courses#update
PUT /courses/:id(.:format)  courses#update
DELETE  /courses/:id(.:format)  courses#destroy
root_path GET / home#index
=end
