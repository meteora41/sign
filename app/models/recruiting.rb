class Recruiting < ApplicationRecord
  
  belongs_to :person
  
  has_many :talks, dependent: :destroy
  
  has_many :favorites, dependent: :destroy
  
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
  
end
