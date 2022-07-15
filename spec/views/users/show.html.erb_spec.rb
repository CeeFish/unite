require 'rails_helper'

RSpec.describe "users/show", type: :view do
    before(:each) do
    @user = assign(:user, User.create!(
      name: "Name",
      email: "Email@test.com",
      password: "123456" #or another password that adheres to your validations
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(//)
  end
end
