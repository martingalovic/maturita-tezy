require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get plan" do
    get static_pages_plan_url
    assert_response :success
  end

end
