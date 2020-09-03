require "application_system_test_case"

class LineCatPicturesTest < ApplicationSystemTestCase
  setup do
    @line_cat_picture = line_cat_pictures(:one)
  end

  test "visiting the index" do
    visit line_cat_pictures_url
    assert_selector "h1", text: "Line Cat Pictures"
  end

  test "creating a Line cat picture" do
    visit line_cat_pictures_url
    click_on "New Line Cat Picture"

    fill_in "Cart", with: @line_cat_picture.cart_id
    fill_in "Cat picture", with: @line_cat_picture.cat_picture_id
    click_on "Create Line cat picture"

    assert_text "Line cat picture was successfully created"
    click_on "Back"
  end

  test "updating a Line cat picture" do
    visit line_cat_pictures_url
    click_on "Edit", match: :first

    fill_in "Cart", with: @line_cat_picture.cart_id
    fill_in "Cat picture", with: @line_cat_picture.cat_picture_id
    click_on "Update Line cat picture"

    assert_text "Line cat picture was successfully updated"
    click_on "Back"
  end

  test "destroying a Line cat picture" do
    visit line_cat_pictures_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Line cat picture was successfully destroyed"
  end
end
