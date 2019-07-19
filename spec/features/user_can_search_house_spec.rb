require "rails_helper"

describe "as a user" do
  it "lets me search house members" do
    visit '/'
    # And I select "Greyjoy" from the dropdown
    select "Greyjoy", :from => "q"
    # And I click on "Get Members"
    click_button "Get Members"

    # Then my path should be "/search" with "house=greyjoy" in the parameters
    expect(current_path).to eq('/search')
    # And I should see a message "7 Members"
    expect(page).to have_content("7 members")
    # And I should see a list of the 7 members of House Greyjoy
    expect(page).to have_selector('.house-member', count: 7)

    # And I should see a name and id for each member.
    expect(page).to have_selector('.house-member-name', count: 7)
    expect(page).to have_selector('.house-member-id', count: 7)
    expect(page).to have_content('Balon Greyjoy')
    expect(page).to have_content('ID: 38')
    save_and_open_page

  end
end
