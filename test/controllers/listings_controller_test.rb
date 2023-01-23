require "test_helper"

class ListingsControllerTest < ActionDispatch::IntegrationTest
  test "should get comment" do
    get listings_comment_url
    assert_response :success
  end
end
