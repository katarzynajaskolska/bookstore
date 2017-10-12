class Rates < Grape::API
  helpers ApiHelpers::AuthenticationHelper

  format :json

  desc 'Endpoints for rates'
  resource :rates do
    before { authenticate! }

    desc 'Create book rate'
    params do
      requires :book_id, type: Integer, desc: 'Book id'
      requires :value, type: Integer, desc: 'Rate value from 1 to 5'
    end
    post do
      Rate.create(user: current_user, book_id: params[:book_id], value: params[:value])
    end

    desc 'Update book rate'
    params do
      requires :rate_id, type: Integer, desc: 'Book id'
      requires :value, type: Integer, desc: 'Rate value from 1 to 5'
    end
    put ':id' do
      current_user.rates.find(params[:rate_id]).update(value: params[:value])
    end

    desc 'Delete book rate'
    params do
      requires :id, type: Integer, desc: 'Rate id'
    end
    delete ':id' do
      current_user.rates.find(params[:id]).destroy
    end
  end
end
