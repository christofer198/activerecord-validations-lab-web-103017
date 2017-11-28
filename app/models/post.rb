class Avalidator < ActiveModel::Validators
  def validate(title)
    arr = ["Won't Believe", "Secret", "Top", "Guess"]
    unless title.include?(arr)
      record.errors[:name] << 'Need a name starting with X please!'
    end
  end
end

class Post < ActiveRecord::Base

  validates_inclusion_of :title, in: %w(Won't\ Believe Secret Top Guess)
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
end
