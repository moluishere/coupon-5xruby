class CouponService
  def initialize(book, coupon)
    @book = book
    @coupon = coupon
  end

  def apply!
    if @book.price >= @coupon.discount
      final_price = @book.price - @coupon.discount
      @book.update(final_price: final_price)
      @book.update(apply_coupon: @coupon.serial)
      @coupon.update(status: true)
      final_price
    else
      raise RangeError
    end
  end
end
