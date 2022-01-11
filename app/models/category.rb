class Category < ApplicationRecord
  validates :name, presence: true, length: { minimun: 3, maximum: 25 } 
  validates_uniqueness_of :name 
  
end