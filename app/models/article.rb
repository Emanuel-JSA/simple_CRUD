class Article < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  
  belongs_to :user
  has_many :article_categories
  has_many :categories, through: :article_categories
end