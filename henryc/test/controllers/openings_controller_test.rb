require "test_helper"

class OpeningsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @opening = openings(:one)
  end

  test "should get index" do
    get openings_url
    assert_response :success
  end

  test "should get new" do
    get new_opening_url
    assert_response :success
  end

  test "should create opening" do
    assert_difference("Opening.count") do
      post openings_url, params: { opening: { date: @opening.date, end: @opening.end, id: @opening.id, start: @opening.start } }
    end

    assert_redirected_to opening_url(Opening.last)
  end

  test "should show opening" do
    get opening_url(@opening)
    assert_response :success
  end

  test "should get edit" do
    get edit_opening_url(@opening)
    assert_response :success
  end

  test "should update opening" do
    patch opening_url(@opening), params: { opening: { date: @opening.date, end: @opening.end, id: @opening.id, start: @opening.start } }
    assert_redirected_to opening_url(@opening)
  end

  test "should destroy opening" do
    assert_difference("Opening.count", -1) do
      delete opening_url(@opening)
    end

    assert_redirected_to openings_url
  end
end
