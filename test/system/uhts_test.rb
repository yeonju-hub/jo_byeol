require "application_system_test_case"

class UhtsTest < ApplicationSystemTestCase
  setup do
    @uht = uhts(:one)
  end

  test "visiting the index" do
    visit uhts_url
    assert_selector "h1", text: "Uhts"
  end

  test "creating a Uht" do
    visit uhts_url
    click_on "New Uht"

    fill_in "Team", with: @uht.team_id
    fill_in "User", with: @uht.user_id
    click_on "Create Uht"

    assert_text "Uht was successfully created"
    click_on "Back"
  end

  test "updating a Uht" do
    visit uhts_url
    click_on "Edit", match: :first

    fill_in "Team", with: @uht.team_id
    fill_in "User", with: @uht.user_id
    click_on "Update Uht"

    assert_text "Uht was successfully updated"
    click_on "Back"
  end

  test "destroying a Uht" do
    visit uhts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Uht was successfully destroyed"
  end
end
