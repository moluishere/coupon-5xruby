require 'rails_helper'

RSpec.describe "coupons/show", type: :view do
  before(:each) do
    @coupon = assign(:coupon, Coupon.create!(
      title: "Title",
      discount_description: "Discount Description",
      discount: 2,
      users: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Discount Description/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(//)
  end
end
