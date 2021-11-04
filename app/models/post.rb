class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
    validate :clickbait 

    def clickbait
        errors.add("Title must be clickbaity") unless 
        title.include?("Won't Believe") 
    end
end
