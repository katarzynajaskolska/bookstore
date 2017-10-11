module Entities
  class BooksEntity < Grape::Entity
    expose :id, :title, :published_at, :author_id
  end
end
