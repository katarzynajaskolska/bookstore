module Entities
  class BooksEntity < Grape::Entity
    expose :title, :published_at, :author_id
  end
end
