require "application_system_test_case"

class BillItemsTest < ApplicationSystemTestCase
  setup do
    @bill_item = bill_items(:one)
  end

  test "visiting the index" do
    visit bill_items_url
    assert_selector "h1", text: "Bill Items"
  end

  test "creating a Bill item" do
    visit bill_items_url
    click_on "New Bill Item"

    fill_in "Name", with: @bill_item.name
    fill_in "Price", with: @bill_item.price
    click_on "Create Bill item"

    assert_text "Bill item was successfully created"
    click_on "Back"
  end

  test "updating a Bill item" do
    visit bill_items_url
    click_on "Edit", match: :first

    fill_in "Name", with: @bill_item.name
    fill_in "Price", with: @bill_item.price
    click_on "Update Bill item"

    assert_text "Bill item was successfully updated"
    click_on "Back"
  end

  test "destroying a Bill item" do
    visit bill_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Bill item was successfully destroyed"
  end
end
