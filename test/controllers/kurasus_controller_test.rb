require 'test_helper'

class KurasusControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get kurasus_create_url
    assert_response :success
  end

  test "should get edit" do
    get kurasus_edit_url
    assert_response :success
  end

  test "should get index" do
    get kurasus_index_url
    assert_response :success
  end

end
