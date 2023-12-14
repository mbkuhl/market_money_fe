require "rails_helper"

RSpec.describe "Markets Show" do

  it 'will have a "more info" button next to each market that takes me to the market show page' do
    visit "/markets/322458"
    expect(page).to have_content("14&U Farmers' Market")
    expect(page).to have_content("1400 U Street NW")
    expect(page).to have_content("Washington, District of Columbia 20009")
    expect(page).to have_content("Vendors at our Market")
    expect(page).to have_content("The Charcuterie Corner")
    
    visit "/markets/331074"
    
    expect(page).to have_content("Yancey County Farmers' Market")
    expect(page).to have_content("Town Center")
    expect(page).to have_content("Burnsville, North Carolina 28714")
    expect(page).to have_content("Vendors at our Market")
    expect(page).to have_content("The Pickle People")
    expect(page).to have_content("Leafy Greens")
    expect(page).to have_content("The Beer Baron")

  end
end