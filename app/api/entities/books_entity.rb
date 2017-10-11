module Entities
  class BooksEntity < Grape::Entity
    expose :id, :title, :published_at, :author

    def author
      "#{object.author.first_name} #{object.author.last_name}"
    end
  end
end
