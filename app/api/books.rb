class Books < Grape::API
  helpers ApiHelpers::AuthenticationHelper

  format :json

  desc 'Endpoints for books'
  resource :books do
    before { authenticate! }

    desc 'Retrieve all books without newest three'
    get do
      books = Book.includes(:author, :rates)
                  .order('updated_at DESC')
                  .offset(3)
      status 200
      present books, with: Entities::BooksEntity, user_id: current_user.id
    end

    desc 'Retrieve single book'
    params do
      requires :id, type: String, desc: 'Book id'
    end
    get ':id' do
      present Book.find(params[:id]), with: Entities::BookEntity
    end
  end

  resource :newest_books do
    before { authenticate! }

    desc 'Retrieve three last added books'
    get do
      books = Book.includes(:author, :rates)
                  .order('updated_at DESC')
                  .limit(3)
      status 200
      present books, with: Entities::BooksEntity, user_id: current_user.id
    end
  end

  resource :book do
    before { authenticate! }
    get do
    end
  end
end
