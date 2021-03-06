class Product < ActiveRecord::Base
  has_many :reviews
  has_many :users, through: :reviews

  validates :description, :name, presence: true
  validates :price_in_cents, numericality: { only_integer: true}

  before_validation :titleize_title

  def price_in_dollars
    dollars = price_in_cents.to_f / 100.0
    dollars = sprintf("$%.2f", dollars)
  end


  private
  
  def titleize_title
    self.name = name.titleize
  end
end
