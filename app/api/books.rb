class Books < Grape::API
  helpers ApiHelpers::AuthenticationHelper

  format :json

  desc 'Endpoints for books'
  resource :books do
    before { authenticate! }

    desc 'Retrieve last three books rated by user'
    get do
      books = Book.includes(:author)
                  .joins(:rates)
                  .where('rates.user_id = ?', current_user.id)
                  .order('rates.updated_at DESC')
                  .limit(3)
      status 200
      present books, with: Entities::BooksEntity
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
