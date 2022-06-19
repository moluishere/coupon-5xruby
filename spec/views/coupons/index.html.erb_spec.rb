require 'rails_helper'

RSpec.describe "coupons/index", type: :view do
  before(:each) do
    assign(:coupons, [
      Coupon.create!(
        title: "Title",
        discount_description: "Discount Description",
        discount: 2,
        users: nil
      ),
      Coupon.create!(
        title: "Title",
        discount_description: "Discount Description",
        discount: 2,
        users: nil
      )
    ])
  end

  it "renders a list of coupons" do
    render
    assert_select "tr>td", text: "Title".to_s, count: 2
    assert_select "tr>td", text: "Discount Description".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
