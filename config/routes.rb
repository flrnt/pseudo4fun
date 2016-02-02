Rails.application.routes.draw do
  resources :pseudos do
    post 'upvote'
    post 'downvote'
  end
end
