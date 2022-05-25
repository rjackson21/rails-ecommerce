require "test_helper"

class CartProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get cart_products_create_url
    assert_response :success
  end
end
