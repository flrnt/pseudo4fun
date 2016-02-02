Rails.application.routes.draw do
  root "pseudos#index"
  resources :pseudos do
    post 'upvote'
  end
end
