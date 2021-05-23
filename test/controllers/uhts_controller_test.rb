require 'test_helper'

class UhtsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @uht = uhts(:one)
  end

  test "should get index" do
    get uhts_url
    assert_response :success
  end

  test "should get new" do
    get new_uht_url
    assert_response :success
  end

  test "should create uht" do
    assert_difference('Uht.count') do
      post uhts_url, params: { uht: { team_id: @uht.team_id, user_id: @uht.user_id } }
    end

    assert_redirected_to uht_url(Uht.last)
  end

  test "should show uht" do
    get uht_url(@uht)
    assert_response :success
  end

  test "should get edit" do
    get edit_uht_url(@uht)
    assert_response :success
  end

  test "should update uht" do
    patch uht_url(@uht), params: { uht: { team_id: @uht.team_id, user_id: @uht.user_id } }
    assert_redirected_to uht_url(@uht)
  end

  test "should destroy uht" do
    assert_difference('Uht.count', -1) do
      delete uht_url(@uht)
    end

    assert_redirected_to uhts_url
  end
end
