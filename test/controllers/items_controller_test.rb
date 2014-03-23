require 'test_helper'

class ItemsControllerTest < ActionController::TestCase
  setup do
    @item = items(:selling_item)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create item" do
    assert_difference('Item.count') do
      post :create, item: { description: @item.description, end_date: @item.end_date, start_price: @item.start_price, status: @item.status, title: @item.title }
    end

    assert_redirected_to item_path(assigns(:item))
  end

  test "should NOT create item when end date is in the past" do
    assert_no_difference('Item.count') do
      post :create, item: { description: @item.description, end_date: DateTime.parse("1998-12-12"), start_price: @item.start_price, status: @item.status, title: @item.title }
    end
  end

  test "should NOT create item when status is invalid" do
    assert_no_difference('Item.count') do
      post :create, item: { description: @item.description, end_date: @item.end_date, start_price: @item.start_price, status: 'invalid status', title: @item.title }
    end
  end

  test "should NOT create item when price is invalid" do
    assert_no_difference('Item.count') do
      post :create, item: { description: @item.description, end_date: @item.end_date, start_price: 'blabal', status: 'invalid status', title: @item.title }
    end
  end

  test "should NOT create item when price is too low" do
    assert_no_difference('Item.count') do
      post :create, item: { description: @item.description, end_date: @item.end_date, start_price: 0.001, status: 'invalid status', title: @item.title }
    end
  end

  test "should NOT create item when title/description is missing" do
    assert_no_difference('Item.count') do
      post :create, item: { description: @item.description, end_date: @item.end_date, start_price: 0.001, status: 'invalid status', title: '' }
      post :create, item: { description: '', end_date: @item.end_date, start_price: 0.001, status: 'invalid status', title: @item.title }
    end
  end

  test "should show item" do
    get :show, id: @item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @item
    assert_response :success
  end

  test "should update item" do
    patch :update, id: @item, item: { description: @item.description, end_date: @item.end_date, start_price: @item.start_price, status: @item.status, title: @item.title }
    assert_redirected_to item_path(assigns(:item))
  end

  test "should NOT update item when there's invalid paramer" do
    patch :update, id: @item, item: { description: @item.description, end_date: @item.end_date, start_price: @item.start_price, status: @item.status, title: @item.title }
    assert_redirected_to item_path(assigns(:item))
  end

  test "should destroy item" do
    assert_difference('Item.count', -1) do
      delete :destroy, id: @item
    end

    assert_redirected_to items_path
  end
end
