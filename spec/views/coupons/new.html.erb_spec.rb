require 'rails_helper'

RSpec.describe "coupons/new", type: :view do
  before(:each) do
    assign(:coupon, Coupon.new(
      title: "MyString",
      discount_description: "MyString",
      discount: 1,
      users: nil
    ))
  end

  it "renders new coupon form" do
    render

    assert_select "form[action=?][method=?]", coupons_path, "post" do

      assert_select "input[name=?]", "coupon[title]"

      assert_select "input[name=?]", "coupon[discount_description]"

      assert_select "input[name=?]", "coupon[discount]"

      assert_select "input[name=?]", "coupon[users_id]"
    end
  end
end
