class Person < ApplicationRecord
  
  belongs_to :user
  
  has_many :recruitings, dependent: :destroy
  
  has_many :talks, dependent: :destroy
  
  has_many :favorites, dependent: :destroy
  
  
end
