class Recruiting < ApplicationRecord
  
  belongs_to :person
  
  has_many :talks, dependent: :destroy
  
  has_many :favorites, dependent: :destroy
  
  def favorited_by?(user)
    favorites.exists?(person_id: user.id)
  end
  
  validates :title, presence: true
  validates :datetime, presence: true, format: { with: /\A\d{2}-\d{2}/ } 
  
  def self.looks(search, word)
      @recruiting = Recruiting.where(["title LIKE(?) OR datetime LIKE(?) OR place LIKE(?)", "%#{word}%", "%#{word}%", "%#{word}%"])
  end
  
end

