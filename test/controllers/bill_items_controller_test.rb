require 'test_helper'

class BillItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bill_item = bill_items(:one)
  end

  test "should get index" do
    get bill_items_url
    assert_response :success
  end

  test "should get new" do
    get new_bill_item_url
    assert_response :success
  end

  test "should create bill_item" do
    assert_difference('BillItem.count') do
      post bill_items_url, params: { bill_item: { name: @bill_item.name, price: @bill_item.price } }
    end

    assert_redirected_to bill_item_url(BillItem.last)
  end

  test "should show bill_item" do
    get bill_item_url(@bill_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_bill_item_url(@bill_item)
    assert_response :success
  end

  test "should update bill_item" do
    patch bill_item_url(@bill_item), params: { bill_item: { name: @bill_item.name, price: @bill_item.price } }
    assert_redirected_to bill_item_url(@bill_item)
  end

  test "should destroy bill_item" do
    assert_difference('BillItem.count', -1) do
      delete bill_item_url(@bill_item)
    end

    assert_redirected_to bill_items_url
  end
end
