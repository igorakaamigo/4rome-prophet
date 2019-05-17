Rails.application.routes.draw do
  root to: 'prophecy#first_page'
  post '/', to: 'prophecy#first_page'

  post :second_page, to: 'prophecy#second_page'
end
