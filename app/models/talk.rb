class Talk < ApplicationRecord
  
  belongs_to :person
  
  belongs_to :recruiting
  
  validates :conversation, presence: true
  
  
end
