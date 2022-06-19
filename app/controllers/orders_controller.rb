# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :authenticate_user!
  # before_action :set_order, only: %i[show edit update destroy]

  def index
    @orders = current_user.orders
  end

  def show; end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(status: 'used')
    respond_to do |format|
      if @order.save
        format.html { redirect_to books_path, notice: 'Order was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def checkout
    @order = Order.find(params[:id])
  end

  def pay; end

  def cancel; end
end
