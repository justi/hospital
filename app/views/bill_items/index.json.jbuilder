# frozen_string_literal: true

json.array! @bill_items, partial: "bill_items/bill_item", as: :bill_item
