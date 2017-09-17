class API < Grape::API
  prefix 'api'
  mount Login
  mount Register

  rescue_from :all
end
