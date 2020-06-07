require 'test_helper'

class BboxContentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bbox_content = bbox_contents(:one)
  end

  test "should get index" do
    get bbox_contents_url
    assert_response :success
  end

  test "should get new" do
    get new_bbox_content_url
    assert_response :success
  end

  test "should create bbox_content" do
    assert_difference('BboxContent.count') do
      post bbox_contents_url, params: { bbox_content: { bbox_id: @bbox_content.bbox_id, completed: @bbox_content.completed, completion_date: @bbox_content.completion_date, due_date: @bbox_content.due_date, insertion_date: @bbox_content.insertion_date, pass_counter: @bbox_content.pass_counter, pinned: @bbox_content.pinned, text: @bbox_content.text } }
    end

    assert_redirected_to bbox_content_url(BboxContent.last)
  end

  test "should show bbox_content" do
    get bbox_content_url(@bbox_content)
    assert_response :success
  end

  test "should get edit" do
    get edit_bbox_content_url(@bbox_content)
    assert_response :success
  end

  test "should update bbox_content" do
    patch bbox_content_url(@bbox_content), params: { bbox_content: { bbox_id: @bbox_content.bbox_id, completed: @bbox_content.completed, completion_date: @bbox_content.completion_date, due_date: @bbox_content.due_date, insertion_date: @bbox_content.insertion_date, pass_counter: @bbox_content.pass_counter, pinned: @bbox_content.pinned, text: @bbox_content.text } }
    assert_redirected_to bbox_content_url(@bbox_content)
  end

  test "should destroy bbox_content" do
    assert_difference('BboxContent.count', -1) do
      delete bbox_content_url(@bbox_content)
    end

    assert_redirected_to bbox_contents_url
  end
end
