require 'test_helper'

class PageControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get people" do
    get :people
    assert_response :success
  end

  test "should get projects" do
    get :projects
    assert_response :success
  end

  test "should get publications" do
    get :publications
    assert_response :success
  end

  test "should get contact" do
    get :contact
    assert_response :success
  end

end
