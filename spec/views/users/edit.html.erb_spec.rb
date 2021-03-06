require 'rails_helper'

RSpec.describe "users/edit", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      name: "Name",
      email: "Email@test.com",
      password: "123456"
    ))
  end

  it "renders the edit user form" do
    render

    assert_select "form[action=?][method=?]", user_path(@user), "post" do

      assert_select "input[name=?]", "user[name]"

      assert_select "input[name=?]", "user[email]"

      assert_select "input[name=?]", "user[password]"
    end
  end
end
