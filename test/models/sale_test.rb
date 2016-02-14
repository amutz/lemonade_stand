require 'test_helper'

class SaleTest < ActiveSupport::TestCase
  test "Customer cannot be blank" do
    assert Sale.new(customer: "Frank", quantity: 1, price: 1).valid?
    assert_not Sale.new(customer: "", quantity: 1, price: 1).valid?
  end

  test "Quantity must be a natural number" do
    assert Sale.new(customer: "Frank", quantity: 1, price: 1).valid?
    assert_not Sale.new(customer: "Frank", quantity: "one", price: 1).valid?
    assert_not Sale.new(customer: "Frank", quantity: 0, price: 1).valid?
    assert_not Sale.new(customer: "Frank", quantity: -1, price: 1).valid?
    assert_not Sale.new(customer: "Frank", quantity: 1.5, price: 1).valid?
  end

  test "Price must be a positive decimal" do
    assert Sale.new(customer: "Frank", quantity: 1, price: 1).valid?
    assert_not Sale.new(customer: "Frank", quantity: 1, price: "one").valid?
    assert Sale.new(customer: "Frank", quantity: 1, price: 1.5).valid?
    assert_not Sale.new(customer: "Frank", quantity: 1, price: -1.5).valid?
    assert_not Sale.new(customer: "Frank", quantity: 1, price: 0).valid?
  end
end
