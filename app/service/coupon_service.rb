class CouponService
  def initialize(book, coupon)
    @book = book
    @coupon = coupon
  end

  def apply!
    if @book.price >= @coupon.discount
      @book.price - @coupon.discount
    else
      raise RangeError
    end
  end
end
