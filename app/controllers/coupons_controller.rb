# frozen_string_literal: true

class CouponsController < ApplicationController
  before_action :authenticate_user! # 必須登入
  before_action :authenticate_admin # 再檢查是否有權限
  before_action :set_coupon, only: %i[show edit update destroy]

  def index
    @coupons = Coupon.all
  end

  def show; end

  def new
    @coupon = Coupon.new
  end

  def edit; end

  def create
    @coupon = Coupon.new(coupon_params)
    if @coupon.save
      redirect_to coupon_url(@coupon), notice: '成功建立折價卷'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @coupon.update(coupon_params)
      redirect_to coupon_url(@coupon), notice: '成功更新折價卷'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @coupon.destroy
    redirect_to coupons_url, notice: '成功刪除折價卷.'
  end

  private

  def set_coupon
    @coupon = Coupon.find(params[:id])
  end

  def coupon_params
    params.require(:coupon).permit(:title, :discount_description, :discount, :serial)
  end
end
