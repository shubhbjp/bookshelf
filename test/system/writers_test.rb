require "application_system_test_case"

class WritersTest < ApplicationSystemTestCase
  setup do
    @writer = writers(:one)
  end

  test "visiting the index" do
    visit writers_url
    assert_selector "h1", text: "Writers"
  end

  test "creating a Writer" do
    visit writers_url
    click_on "New Writer"

    fill_in "Address", with: @writer.address
    fill_in "City", with: @writer.city
    fill_in "Country", with: @writer.country
    check "Isactive" if @writer.isActive
    fill_in "Name", with: @writer.name
    fill_in "Pincode", with: @writer.pincode
    fill_in "State", with: @writer.state
    click_on "Create Writer"

    assert_text "Writer was successfully created"
    click_on "Back"
  end

  test "updating a Writer" do
    visit writers_url
    click_on "Edit", match: :first

    fill_in "Address", with: @writer.address
    fill_in "City", with: @writer.city
    fill_in "Country", with: @writer.country
    check "Isactive" if @writer.isActive
    fill_in "Name", with: @writer.name
    fill_in "Pincode", with: @writer.pincode
    fill_in "State", with: @writer.state
    click_on "Update Writer"

    assert_text "Writer was successfully updated"
    click_on "Back"
  end

  test "destroying a Writer" do
    visit writers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Writer was successfully destroyed"
  end
end
