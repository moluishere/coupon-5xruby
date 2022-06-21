# frozen_string_literal: true

class CouponsController < ApplicationController
  before_action :authenticate_user! # 必須登入
  before_action :authenticate_admin # 再檢查是否有權限
  before_action :set_coupon, only: %i[show edit update destroy]

  # GET /coupons or /coupons.json
  def index
    @coupons = Coupon.all
  end

  # GET /coupons/1 or /coupons/1.json
  def show; end

  # GET /coupons/new
  def new
    @coupon = Coupon.new
  end

  # GET /coupons/1/edit
  def edit; end

  # POST /coupons or /coupons.json
  def create
    @coupon = Coupon.new(coupon_params)

    respond_to do |format|
      if @coupon.save
        format.html { redirect_to coupon_url(@coupon), notice: 'Coupon was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /coupons/1 or /coupons/1.json
  def update
    respond_to do |format|
      if @coupon.update(coupon_params)
        format.html { redirect_to coupon_url(@coupon), notice: 'Coupon was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coupons/1 or /coupons/1.json
  def destroy
    @coupon.destroy

    respond_to do |format|
      format.html { redirect_to coupons_url, notice: 'Coupon was successfully destroyed.' }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_coupon
    @coupon = Coupon.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def coupon_params
    params.require(:coupon).permit(:title, :discount_description, :discount)
  end
end