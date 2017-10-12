class API < Grape::API
  prefix 'api'
  mount Login
  mount Register
  mount Books
  mount Rates

  rescue_from :all
end
