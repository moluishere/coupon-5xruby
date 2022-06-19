require 'rails_helper'

RSpec.describe "coupons/edit", type: :view do
  before(:each) do
    @coupon = assign(:coupon, Coupon.create!(
      title: "MyString",
      discount_description: "MyString",
      discount: 1,
      users: nil
    ))
  end

  it "renders the edit coupon form" do
    render

    assert_select "form[action=?][method=?]", coupon_path(@coupon), "post" do

      assert_select "input[name=?]", "coupon[title]"

      assert_select "input[name=?]", "coupon[discount_description]"

      assert_select "input[name=?]", "coupon[discount]"

      assert_select "input[name=?]", "coupon[users_id]"
    end
  end
end
