Rails.application.routes.draw do
  # GET /api/v1/questions -> questions#index
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :questions
      resource :session, only: [:create, :destroy]
      resources :users, only: [] do
        # /api/v1/users/current
        get :current, on: :collection
        # default
        # /api/v1/users/:id/current
        # on: :member
        # /api/v1/users/:user_id/current
      end
    end
  end
  # rails routes | grep api/v1

  match(
    "/delayed_job",
    to: DelayedJobWeb,
    anchor: false,
    via: [:get, :post]
  )

  resources :job_posts, only: [:new,:create, :show,:destroy]
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only:[:new, :create]
  # resource is singular instead of resources
  # Unlike resources, resource will create routes
  # that do CRUD operation on only one thing. There
  # will be no index routes and no route will have an
  # :id wildcard. When using a singular resouce
  # the controller name must still be plural.
  resource :session, only:[:new, :create, :destroy]
  # resources method will generate all CRUD routes
  # following RESTful conventions for a resource.
  # It will assume there is a controller named after
  # the first argument pluralized and PascalCased
  # (i.e. :question => QuestionsController )
  resources :questions do 
    resources :answers, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
  end
  # get('/questions/new', to: 'questions#new', as: :new_question)
  # post('/questions', to: 'questions#create', as: :questions)
  # get('/questions/:id', to: 'questions#show', as: :question)
  # # question_path(<id>), question_url(<id>)
  # get('/questions/:id/edit', to: 'questions#edit', as: :edit_question)
  # # edit_question_path(<id>), edit_question_url(<id>)
  # patch("/questions/:id", to: "questions#update")
  # delete('/questions/:id', to: 'questions#destroy')
  # get('/questions', to: 'questions#index')

  post('/contacts', { to: 'contact#create' })
  get('/contacts/new', { to: 'contact#new' })

  # this defines a `route` rule that says when we recieve a `GET` request with
  # URL `/`, handle it using the `WelcomeController` with `index` action
  # inside that controller
  # the `as` option is used for helper url/path, it overrides or generates
  # helper method that you can use in your views or controllers
  get('/', { to: 'welcome#index', as: 'root' })

end
