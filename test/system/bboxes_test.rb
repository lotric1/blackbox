require "application_system_test_case"

class BboxesTest < ApplicationSystemTestCase
  setup do
    @bbox = bboxes(:one)
  end

  test "visiting the index" do
    visit bboxes_url
    assert_selector "h1", text: "Bboxes"
  end

  test "creating a Bbox" do
    visit bboxes_url
    click_on "New Bbox"

    fill_in "Color", with: @bbox.color
    fill_in "Creation date", with: @bbox.creation_date
    fill_in "Items per day", with: @bbox.items_per_day
    fill_in "Position", with: @bbox.position
    check "Starred" if @bbox.starred
    fill_in "Title", with: @bbox.title
    click_on "Create Bbox"

    assert_text "Bbox was successfully created"
    click_on "Back"
  end

  test "updating a Bbox" do
    visit bboxes_url
    click_on "Edit", match: :first

    fill_in "Color", with: @bbox.color
    fill_in "Creation date", with: @bbox.creation_date
    fill_in "Items per day", with: @bbox.items_per_day
    fill_in "Position", with: @bbox.position
    check "Starred" if @bbox.starred
    fill_in "Title", with: @bbox.title
    click_on "Update Bbox"

    assert_text "Bbox was successfully updated"
    click_on "Back"
  end

  test "destroying a Bbox" do
    visit bboxes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Bbox was successfully destroyed"
  end
end
