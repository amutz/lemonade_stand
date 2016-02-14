class Sale < ActiveRecord::Base
  validates :customer, presence: true, uniqueness: true
  validates :quantity, numericality: { only_integer: true, greater_than: 0 }
  validates :price, numericality: { greater_than: 0 }
end
