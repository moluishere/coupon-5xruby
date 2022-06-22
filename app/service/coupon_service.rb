class CouponService
  def initialize(book, coupon)
    @book = book
    @coupon = coupon
  end

  def apply!
    if @book.price >= @coupon.discount
      final_price = @book.price - @coupon.discount
      @book.update(price: final_price)
      @coupon.destroy
      final_price
    else
      raise RangeError
    end
  end
end
