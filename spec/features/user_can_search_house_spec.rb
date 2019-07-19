describe "as a user" do
  it "lets me search house members" do

    # When I visit "/"
    visit '/'
    # And I select "Greyjoy" from the dropdown
    select "Greyjoy", :from => "organizationSelect"
    # And I click on "Get Members"
    click "Get Members"

    # Then my path should be "/search" with "house=greyjoy" in the parameters
    expect(current_path).to eq('/search')
    # And I should see a message "7 Members"
    # And I should see a list of the 7 members of House Greyjoy
    # And I should see a name and id for each member.
    #
  end
end
