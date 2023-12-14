require "rails_helper"

RSpec.describe "Markets Show" do

  it 'each market show page includes, name, full address, and vendors present at the market (that are links to the vendor show page)' do
    visit "/markets/322458"
    expect(page).to have_content("14&U Farmers' Market")
    expect(page).to have_content("1400 U Street NW")
    expect(page).to have_content("Washington, District of Columbia 20009")
    expect(page).to have_content("Vendors at our Market")
    expect(page).to have_content("The Charcuterie Corner")
    
    click_link("The Charcuterie Corner")
    expect(current_path).to eq("/vendors/55823")

    visit "/markets/331074"
    
    expect(page).to have_content("Yancey County Farmers' Market")
    expect(page).to have_content("Town Center")
    expect(page).to have_content("Burnsville, North Carolina 28714")
    expect(page).to have_content("Vendors at our Market")
    expect(page).to have_content("The Pickle People")
    expect(page).to have_content("Leafy Greens")
    expect(page).to have_content("The Beer Baron")

    click_link("Leafy Greens")
    expect(current_path).to eq("/vendors/55149")
  end
end