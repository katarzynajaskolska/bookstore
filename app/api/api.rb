class API < Grape::API
  prefix 'api'
  mount Login
  mount Register
  mount Books

  rescue_from :all
end
