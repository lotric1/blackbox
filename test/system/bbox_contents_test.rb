require "application_system_test_case"

class BboxContentsTest < ApplicationSystemTestCase
  setup do
    @bbox_content = bbox_contents(:one)
  end

  test "visiting the index" do
    visit bbox_contents_url
    assert_selector "h1", text: "Bbox Contents"
  end

  test "creating a Bbox content" do
    visit bbox_contents_url
    click_on "New Bbox Content"

    fill_in "Bbox", with: @bbox_content.bbox_id
    check "Completed" if @bbox_content.completed
    fill_in "Completion date", with: @bbox_content.completion_date
    fill_in "Due date", with: @bbox_content.due_date
    fill_in "Insertion date", with: @bbox_content.insertion_date
    fill_in "Pass counter", with: @bbox_content.pass_counter
    check "Pinned" if @bbox_content.pinned
    fill_in "Text", with: @bbox_content.text
    click_on "Create Bbox content"

    assert_text "Bbox content was successfully created"
    click_on "Back"
  end

  test "updating a Bbox content" do
    visit bbox_contents_url
    click_on "Edit", match: :first

    fill_in "Bbox", with: @bbox_content.bbox_id
    check "Completed" if @bbox_content.completed
    fill_in "Completion date", with: @bbox_content.completion_date
    fill_in "Due date", with: @bbox_content.due_date
    fill_in "Insertion date", with: @bbox_content.insertion_date
    fill_in "Pass counter", with: @bbox_content.pass_counter
    check "Pinned" if @bbox_content.pinned
    fill_in "Text", with: @bbox_content.text
    click_on "Update Bbox content"

    assert_text "Bbox content was successfully updated"
    click_on "Back"
  end

  test "destroying a Bbox content" do
    visit bbox_contents_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Bbox content was successfully destroyed"
  end
end
