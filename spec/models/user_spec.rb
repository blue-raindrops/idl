require 'rails_helper'
require 'spec_helper'

describe User do
  before :each do 
    @user = User.new(name: "aUser", email: "aUser@cornell.edu", password: "aPass")
  end

  subject {@user}
    it {should respond_to(:name)}
    it {should respond_to(:email)}
    it {should respond_to(:password)}

    it {should be_valid}

    describe "name missing" do 
      before {@user.name = ""}
      it {should_not be_valid}
    end

    describe "email missing" do 
      before {@user.email = ""}
      it {should_not be_valid}
    end
end