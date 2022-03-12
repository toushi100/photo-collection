require "test_helper"

class PhotosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @photo = photos(:one)
  end

  test "should get index" do
    get photos_url, as: :json
    assert_response :success
  end

  test "should create photo" do
    assert_difference("Photo.count") do
      post photos_url, params: { photo: { author_id: @photo.author_id, venue_id: @photo.venue_id } }, as: :json
    end

    assert_response :created
  end

  test "should show photo" do
    get photo_url(@photo), as: :json
    assert_response :success
  end

  test "should update photo" do
    patch photo_url(@photo), params: { photo: { author_id: @photo.author_id, venue_id: @photo.venue_id } }, as: :json
    assert_response :success
  end

  test "should destroy photo" do
    assert_difference("Photo.count", -1) do
      delete photo_url(@photo), as: :json
    end

    assert_response :no_content
  end
end
