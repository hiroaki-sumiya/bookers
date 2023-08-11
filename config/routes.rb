Rails.application.routes.draw do
  get '' => 'homes#top'
  get '/' => 'homes#top', as: 'root'
  get 'top' => 'homes#top'

  get 'books' => 'books#index', as: 'books'
  post 'books' => 'books#create'
  
  get 'books/:id' => 'books#show', as: 'book'
  patch 'books/:id' => 'books#update', as: 'update'
  delete 'books/:id' => 'books#destroy', as: 'destroy'
  get 'books/:id/edit' => 'books#edit', as: 'edit_book'
end
