require 'rails_helper'
# 載入 rails 環境

RSpec.describe Coupon, type: :model do
  it '可以產生「隨機」折價卷序號' do
    coupon = FactoryBot.create(:coupon)

    expect(coupon.serial).not_to be_nil
  end

  it '可以產生「特定」的折價卷序號' do
    coupon = FactoryBot.create(:coupon, serial: 'RspecIsCool')
    expect(coupon.serial).to eq 'RspecIsCool'
  end

  it '不能產生同樣的折價卷序號，並且會噴錯' do
    coupon = FactoryBot.create(:coupon, serial: 'DontRepeatMe')

    expect do
      FactoryBot.create(:coupon, serial: 'DontRepeatMe')
    end.to raise_error ActiveRecord::RecordInvalid
  end
end
