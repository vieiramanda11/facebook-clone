class Post < ApplicationRecord
    belongs_to :user
    validation :content, presence: true, length: {minimum:5} 
    
end
