require 'test_helper'

class NewsPagesControllerTest < ActionController::TestCase
  setup do
    @news_page = news_pages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:news_pages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create news_page" do
    assert_difference('NewsPage.count') do
      post :create, news_page: { content: @news_page.content, title: @news_page.title }
    end

    assert_redirected_to news_page_path(assigns(:news_page))
  end

  test "should show news_page" do
    get :show, id: @news_page
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @news_page
    assert_response :success
  end

  test "should update news_page" do
    patch :update, id: @news_page, news_page: { content: @news_page.content, title: @news_page.title }
    assert_redirected_to news_page_path(assigns(:news_page))
  end

  test "should destroy news_page" do
    assert_difference('NewsPage.count', -1) do
      delete :destroy, id: @news_page
    end

    assert_redirected_to news_pages_path
  end
end
