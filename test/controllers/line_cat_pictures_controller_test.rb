require 'test_helper'

class LineCatPicturesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @line_cat_picture = line_cat_pictures(:one)
  end

  test "should get index" do
    get line_cat_pictures_url
    assert_response :success
  end

  test "should get new" do
    get new_line_cat_picture_url
    assert_response :success
  end

  test "should create line_cat_picture" do
    assert_difference('LineCatPicture.count') do
      post line_cat_pictures_url, params: { line_cat_picture: { cart_id: @line_cat_picture.cart_id, cat_picture_id: @line_cat_picture.cat_picture_id } }
    end

    assert_redirected_to line_cat_picture_url(LineCatPicture.last)
  end

  test "should show line_cat_picture" do
    get line_cat_picture_url(@line_cat_picture)
    assert_response :success
  end

  test "should get edit" do
    get edit_line_cat_picture_url(@line_cat_picture)
    assert_response :success
  end

  test "should update line_cat_picture" do
    patch line_cat_picture_url(@line_cat_picture), params: { line_cat_picture: { cart_id: @line_cat_picture.cart_id, cat_picture_id: @line_cat_picture.cat_picture_id } }
    assert_redirected_to line_cat_picture_url(@line_cat_picture)
  end

  test "should destroy line_cat_picture" do
    assert_difference('LineCatPicture.count', -1) do
      delete line_cat_picture_url(@line_cat_picture)
    end

    assert_redirected_to line_cat_pictures_url
  end
end
