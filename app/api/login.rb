class Login < Grape::API
  format :json

  desc 'Endpoints for login'

  namespace :login do
    desc 'Login via email and password'
    params do
      requires :email, type: String, desc: 'email'
      requires :password, type: String, desc: 'password'
    end
    post do
    end
  end
end
