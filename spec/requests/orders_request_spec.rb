require 'rails_helper'

RSpec.describe "Orders", type: :request do

  describe "get orders_path" do
    it "renders the index view" do
      FactoryBot.create_list(:order, 10)
      get orders_path
      expect(response.status).to eq(200)
    end
  end

  describe "delete a order record" do
    it "deletes a order record" do
      # start assignment
      order = FactoryBot.create(:order)
      expect { delete order_path(order.id) }.to change(Order, :count)
      expect(Order.count).to eq(0)
    end
  end

  describe "put customer_path with invalid data" do
    it "does not update the order record or redirect" do
      order = FactoryBot.create(:order)
      put order_path(id: order.id), params: {order: { product_count: "123"}}
      order.reload
      expect(order.product_count).to_not eq("123")
      expect(response.status).to eq(302)
    end
  end

  describe "put order_path with valid data" do
    it "updates an entry and redirects to the show path for the order" do
      order = FactoryBot.create(:order)

      params = {
        order: {
          product_name: "Pens",
          product_count: 1,
          customer: "Cindy"
        }
      }
      expect { put order_path(order.id), params: params }.to_not change(Order, :count)
      order.reload
      expect(order.product_name).to eq("Pens")
    end
  end

  describe "post orders_path with invalid data" do
    it "does not save a new entry or redirect" do
      order_attributes = FactoryBot.attributes_for(:order)
      order_attributes.delete(:product_name)
      expect { post orders_path, {order: order_attributes} }.to_not change(Order, :count)
      expect(response.status).to eq(200)
    end
  end

end
