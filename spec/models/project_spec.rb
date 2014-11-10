require 'rails_helper'
require 'spec_helper'

describe Project do
  before :each do 
    @project = Project.new(title: "aProject", people: "aPerson, twoPerson", description: "aProject is here")
  end

  subject {@project}
    it {should respond_to(:title)}
    it {should respond_to(:people)}
    it {should respond_to(:description)}

    it {should be_valid}

    describe "title missing" do 
      before {@project.title = ""}
      it {should_not be_valid}
    end

    describe "people missing" do 
      before {@project.people = ""}
      it {should_not be_valid}
    end

    describe "description missing" do 
      before {@project.description = ""}
      it {should_not be_valid}
    end
end