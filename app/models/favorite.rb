class Favorite < ApplicationRecord
  
  belongs_to :person
  belongs_to :recruiting
  
  validates :person_id, uniqueness: {scope: :recruiting_id}
  
end
