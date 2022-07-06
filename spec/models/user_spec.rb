require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: "John Doe", email: "jdoe@nomail.com", password: "helloworld") }
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is not valid without a name" do
    subject.name=nil
    expect(subject).to_not be_valid
  end
  it "is not valid without an email" do
    subject.email=nil
    expect(subject).to_not be_valid
  end
  it "is not valid if the email address doesn't have a @" do
    subject.email=nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a password" do
    subject.password=nil
    expect(subject).to_not be_valid
  end
  it "is not valid if the password doesn't have minimum length of 6 characters" do
    subject.password= "hello"
    expect(subject).to_not be_valid
  end
end