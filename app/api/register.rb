class Register < Grape::API
  format :json

  desc 'Endpoints for registration'

  namespace :register do
    desc 'Register with email and password'
    params do
      requires :email, type: String, desc: 'email'
      requires :password, type: String, desc: 'password'
    end
    post do
      user = User.new(email: params[:email], password: params[:password], password_confirmation: params[:password])
      if user.save
        token = AuthenticationToken.generate(user)
        status 200
        present token.user, with: Entities::UserWithTokenEntity
      else
        errors = user.errors.full_messages
        error!({ 'errors' => errors }, 400)
      end
    end
  end
end
