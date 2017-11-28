class Avalidator < ActiveModel::Validator
  def validate(title)
    arr = ["Won't Believe", "Secret", "Top", "Guess"]
    unless %w(title).include?(arr) == true
      record.errors[:name] << 'Need a name starting with X please!'
    end
  end
end

class Post < ActiveRecord::Base
  include ActiveModel::Validations
  validates :title, presence: true
  validates_with Avalidator 
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
end
