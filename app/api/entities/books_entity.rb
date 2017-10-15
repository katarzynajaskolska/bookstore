module Entities
  class BooksEntity < Grape::Entity
    expose :id, :title, :published_at, :author, :user_rate, :image_url

    def author
      "#{object.author.first_name} #{object.author.last_name}"
    end

    def user_rate
      object.rates.find_by(user_id: options[:user_id])&.value
    end
  end
end
