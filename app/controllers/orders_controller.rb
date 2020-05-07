class OrdersController < ApplicationController
  before_action :set_order, except: [:index, :new, :create]

# 05/03/2020 Lesson7 Putting it all together

  def index
    @orders = Order.all
  end

  def show

  end

  def new
    @order = Order.new
  end

  def create
    # @order = Order.new(order_params)
    # @order.save
    # redirect_to @order
    # redirect_to orders_path

    @order = Order.new(order_params)
    if @order.save
      flash.notice = "The order record was created successfully."
      redirect_to @order
    else
      flash.now.alert = @order.errors.full_messages.to_sentence
      render :new
    end
  end

  def edit

  end

  def update
    # @order.update(order_params)
    # redirect_to @order

    if @order.update(order_params)
      flash.notice = "The order record was updated successfully."
      redirect_to orders_path
    else
      flash.now.alert = @order.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    @order.destroy
    redirect_to orders_path
  end

  private
    def order_params
      params.require(:order).permit(:product_name, :product_count, :customer_id)
    end

    def set_order
      @order = Order.find(params[:id])
    end

end
