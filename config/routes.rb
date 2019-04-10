Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  post('/contacts', { to: 'contact#create' })
  get("/contacts/new", {to: "contact#new"})
  get('/questions/new', {to: 'questions#new', as: :new_question})
  post('/questions', to: 'questions#create', as: :questions)
  get('/questions/:id', to: 'questions#show', as: :question)
  get('/questions/:id/edit', to: 'questions#edit', as: :edit_question)
  patch("/questions/:id", to: "questions#update")
  delete('/questions/:id', to: 'questions#destroy')
  get('/questions', to: 'questions#index')
  # this defines a `route` rule that says when we recieve a `GET` request with 
  # URL `/`, handle it using the `WelcomeController` with `index` action 
  # inside that controller
  # the `as` option is used for helper url/path
  get('/', { to: 'welcome#index', as: 'root' })

end
