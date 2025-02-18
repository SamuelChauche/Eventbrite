require "test_helper"

class StaticPageControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get static_page_index_url
    assert_response :success
  end

  test "should get secret" do
    get static_page_secret_url
    assert_response :success
  end
end
