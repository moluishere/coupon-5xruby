# frozen_string_literal: true

class BooksController < ApplicationController
  before_action :set_book, only: %i[show edit update destroy apply_coupon]

  def index
    @books = Book.all
  end

  def show; end

  def new
    @book = Book.new
  end

  def edit; end

  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to book_url(@book), notice: '商品成功建立'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @book.update(book_params)
      redirect_to book_url(@book), notice: '商品成功更新'
    else
      render :edit
    end
  end

  def destroy
    @book.destroy

    redirect_to books_url, notice: '商品成功刪除'
  end

  def apply_coupon
    coupon = Coupon.find_by(serial: params[:serial])
    book = @book
    if coupon.nil?
      redirect_to book_path, notice: '沒有這個折價卷喔！'
    elsif coupon.status?
      redirect_to book_path, notice: '折價卷已經使用過了喔！'
    elsif book.apply_coupon != coupon.serial
      redirect_to book_path, notice: '折價卷只能使用一張喔！'
    elsif CouponService.new(book, coupon).apply!
      redirect_to book_path, notice: '成功使用折價卷'
    end
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :price)
  end
end
