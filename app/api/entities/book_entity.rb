module Entities
  class BookEntity < Grape::Entity
    expose :title, :description, :published_at, :author_id
  end
end
