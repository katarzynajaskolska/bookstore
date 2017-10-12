class Books < Grape::API
  helpers ApiHelpers::AuthenticationHelper

  format :json

  desc 'Endpoints for books'
  resource :books do
    before { authenticate! }

    desc 'Retrieve all books'
    get do
      status 200
      present Book.includes(:author, :rates), with: Entities::BooksEntity, user_id: current_user.id
    end

    desc 'Retrieve single book'
    params do
      requires :id, type: String, desc: 'Book id'
    end
    get ':id' do
      present Book.find(params[:id]), with: Entities::BookEntity
    end
  end

  resource :book do
    before { authenticate! }
    get do
    end
  end
end
