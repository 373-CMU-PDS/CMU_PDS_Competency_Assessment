PDSAssessment::Application.routes.draw do
  resources :indicator_questions

  resources :indicator_resources
  resources :resources
  resources :indicators
  resources :competencies
  resources :competency_steps

  # Routes for View All Process
  get 'view_all/index' => 'view_all#index', as: :view_all_index
  get 'view_all/choose_competency' => 'view_all#choose_competency', as: :view_all_competency_step
  get 'view_all/choose_level' => 'view_all#choose_level', as: :view_all_level_step
  get 'view_all/view_indicator_and_resources' => 'view_all#view_indicators_and_resources', as: :view_all_ind_res_step
  get 'view_all/process_flow' => 'view_all#process_flow', as: :view_all_process_flow
  get 'view_all/report_format' => 'view_all#report_format', as: :view_all_report_format


  # Route for Resources
  put 'resource/:id/toggle_active' => 'resources#toggle_active', as: :toggle_active

  # Routes for Home
  get '/dashboard' => 'home#dashboard', as: :dashboard
  get '/' => 'home#home', as: :home

  # Routes for downloading csv templates and training manual
  get 'template_downloader/template/:filename' => 'template_downloader#download', as: :template_downloader
  get 'template_downloader/training' => 'template_downloader#training_manual', as: :training_downloader

  # Routes for Assessment View
  get 'questions/choose_competency' => 'questions#choose_competency', as: :question_competency_step
  get 'questions/view' => 'questions#view', as: :question_view_step
  put 'questions/:id/toggle_active' => 'questions#toggle_active', as: :toggle_question_active
  get 'questions/:id/edit' => 'questions#edit', as: :edit_question
  put 'questions/create' => 'questions#create', as: :new_question

  # Routes for uploading csv files
  put 'competency/upload' => 'competency_steps#upload', as: :competency_upload

  # Routes for user authentication
  get "users/new" => 'users#new', as: :new_user
  post "users/signup" => 'users#signup', as: :sign_up
  get "users/signin" => 'users#signin', as: :sign_in
  post "users/login" => 'users#login', as: :login
  get "users/logout" => 'users#logout', as: :logout
  get "users/edit" => 'users#edit', as: :edit_user
  put "users/update" => 'users#update', as: :update_user

  # Routes for taking an assessment
  get 'assessments/welcome' => 'assessments#welcome', as: :assessment_welcome
  get 'assessments/choose' => 'assessments#choose', as: :assessment_choose
  get 'assessments/take_assessment' => 'assessments#take_assessment', as: :take_assessment
  post 'assessments/report' => 'assessments#generate_report', as: :generate_assessment_report
  get 'assessments/report' => 'assessments#present_report', as: :assessment_report

  # Route for populating test database from browser
  post 'populate_rake' => 'home#populate_rake', as: :populate_rake

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
