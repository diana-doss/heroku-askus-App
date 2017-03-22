Rails.application.routes.draw do

  

  devise_for :users

  devise_scope :user do
    authenticated :user do
      root 'questions#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  resources :questions do
    member do 
          post 'upvote'
        end
   resources :answers
end

  # member do
  #   put "like", to: "questions#upvote"
  #   put "dislike", to: "questions#downvote"
  # end

end