class Books < Grape::API
  helpers ApiHelpers::AuthenticationHelper

  format :json

  desc 'Endpoints for books'
  namespace :books do
    before { authenticate! }

    desc 'Retrieve books'
    get do
    end
  end

  namespace :book do
    get do
    end
  end
end
