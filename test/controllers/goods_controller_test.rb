require 'test_helper'

class GoodsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get goods_index_url
    assert_response :success
  end

  test "should get import" do
    get goods_import_url
    assert_response :success
  end

end
