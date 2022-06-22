require 'rails_helper'

RSpec.describe 'apply coupon on page', type: :request do
  describe 'GET/show' do
    it '可以使用折價卷服務（書本價格 - 折價卷價格）' do
      book = FactoryBot.create(:book, price: 200)
      coupon = FactoryBot.create(:coupon, discount: 150)

      final_price = CouponService.new(book, coupon).apply!

      expect(final_price).to be 50
    end

    it '書本價格低於折價卷，不可使用折價卷' do
      book = FactoryBot.create(:book, price: 100)
      coupon = FactoryBot.create(:coupon, discount: 200)

      expect { CouponService.new(book, coupon).apply! }.to raise_error RangeError
    end

    it '每次消費只能使用一張折價卷' do
      book = FactoryBot.create(:book)
      coupon1 = FactoryBot.create(:coupon, serial: 'ApplyME!')
      coupon2 = FactoryBot.create(:coupon, serial: 'DontApplyME!')
      CouponService.new(book, coupon1).apply!
      CouponService.new(book, coupon2).apply!

      expect { book.apply_coupon eq 'DontApplyME!' }.to raise_error
    end
  end
end
