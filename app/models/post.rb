class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validate :clickbait

    def clickbait
        unless !title.nil? && title.include?("Won't Believe" || "Secret" || "Guess" || "/Top [0..9]*/")
            errors.add(:title, "Title is not click-baity enough")
        end
    end
end
