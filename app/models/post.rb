
class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :is_clickbait?

  

  def is_clickbait?
    if /Won't Believe/.match(title)
      errors.add(:title, "must be clickbait")
    end
  end
end
