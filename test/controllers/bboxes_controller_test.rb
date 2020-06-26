require 'test_helper'

class BboxesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bbox = bboxes(:one)
  end

  test "should get index" do
    get bboxes_url
    assert_response :success
  end

  test "should get new" do
    get new_bbox_url
    assert_response :success
  end

  test "should create bbox" do
    assert_difference('Bbox.count') do
      post bboxes_url, params: { bbox: { color: @bbox.color, creation_date: @bbox.creation_date, items_per_day: @bbox.items_per_day, position: @bbox.position, starred: @bbox.starred, title: @bbox.title } }
    end

    assert_redirected_to bbox_url(Bbox.last)
  end

  test "should show bbox" do
    get bbox_url(@bbox)
    assert_response :success
  end

  test "should get edit" do
    get edit_bbox_url(@bbox)
    assert_response :success
  end

  test "should update bbox" do
    patch bbox_url(@bbox), params: { bbox: { color: @bbox.color, creation_date: @bbox.creation_date, items_per_day: @bbox.items_per_day, position: @bbox.position, starred: @bbox.starred, title: @bbox.title } }
    assert_redirected_to bbox_url(@bbox)
  end

  test "should destroy bbox" do
    assert_difference('Bbox.count', -1) do
      delete bbox_url(@bbox)
    end

    assert_redirected_to bboxes_url
  end
end
