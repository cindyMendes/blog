require 'rails_helper'

RSpec.describe Order, type: :model do
  subject { Order.new( product_name: "gears", product_count: 7, customer: FactoryBot.create(:customer))}

  it 'should have a customer' do
    order = Order.new(product_name: "Cindy", product_count: 1)
    order.save
    expect(Order.count).to eq 0
  end

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a product_name" do
    subject.product_name=nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a product_count" do
    subject.product_count=nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a customer id" do
    subject.customer_id=nil
    expect(subject).to_not be_valid
  end

  it "is not valid if the product count is not all digits" do
    subject.product_count='0123456789'
    expect(subject).to be_valid
  end
  
  # pending "add some examples to (or delete) #{__FILE__}"
end
