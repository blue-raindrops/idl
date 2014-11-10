require 'rails_helper'
require 'spec_helper'

describe Person do
  before :each do 
    @person = Person.new(name: "thisPerson", title: "aPerson", contact: "thatPerson@cornell.edu", site: "http://idl.cornell.edu", projects: "p1, p2")
  end

  subject {@person}
    it {should respond_to(:name)}
    it {should respond_to(:title)}
    it {should respond_to(:projects)}
    it {should respond_to(:contact)}
    it {should respond_to(:site)}

    it {should be_valid}

    describe "title missing" do 
      before {@person.title = ""}
      it {should_not be_valid}
    end

    describe "name missing" do 
      before {@person.name = ""}
      it {should_not be_valid}
    end
end