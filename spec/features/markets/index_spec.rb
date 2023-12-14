require "rails_helper"

RSpec.describe "Markets Index" do

  it "Will show the all markets listed with their name, city, and state" do
    visit "/markets"
    expect(page).to have_content("City")
    expect(page).to have_content("State")

    within("#market322458") do
      expect(page).to have_content("14&U Farmers' Market")
      expect(page).to have_content("Washington")
      expect(page).to have_content("District of Columbia")
    end
    within("#market331074") do
      expect(page).to have_content("Yancey County Farmers' Market")
      expect(page).to have_content("Burnsville")
      expect(page).to have_content("North Carolina")
      
    end
  end

  it 'will have a "more info" button next to each market that takes me to the market show page' do
    visit "/markets"
    
    within("#market322458") do
      click_button("More Info")
    end
    expect(current_path).to eq('/markets/322458')

    visit "/markets"

    within("#market331074") do
      click_button("More Info")
    end
    expect(current_path).to eq('/markets/331074')

  end
end