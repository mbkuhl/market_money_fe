require "rails_helper"

RSpec.describe "Vendors Show", type: :feature do

  it 'will have a "more info" button next to each market that takes me to the market show page' do
    visit "/vendors/55823"

    expect(page).to have_content("The Charcuterie Corner")
    expect(page).to have_content("Contact Info:")
    expect(page).to have_content("name: Claudie Langworth III")
    expect(page).to have_content("phone: 1-147-179-9747")
    expect(page).to have_content("Credit Accepted?: NO")
    expect(page).to have_content("Description: Vendor selling a variety of artisanal cured meats and sausages.")
    
    visit "/vendors/55149"
    expect(page).to have_content("Leafy Greens")
    expect(page).to have_content("Contact Info:")
    expect(page).to have_content("name: Tari Ledner")
    expect(page).to have_content("phone: 1-129-873-5578")
    expect(page).to have_content("Credit Accepted?: YES")
    expect(page).to have_content("Description: sells a variety of leafy greens and salad mixes")
  end

  it "can search for markets" do
    visit "/vendors/55823"
    expect(page).to have_content("Search for Markets to Add")
    expect(page).to_not have_content("Nob Hill Growers' Market")

    fill_in :state, with: "New Mexico"
    fill_in :city, with: "Albuquerque"
    fill_in :name, with: "Nob"
    click_button "Search for Markets"
    expect(current_path).to eq("/vendors/55823")

    expect(page).to have_content("Nob Hill Growers' Market")
    click_link "Nob Hill Growers' Market"
    expect(current_path).to eq("/markets/327794")
    expect(page).to have_content("Lead & Morningside SE")
  end

  it "Doesnt allow city search without state" do
    visit "/vendors/55823"
    expect(page).to have_content("Search for Markets to Add")
    expect(page).to_not have_content("Nob Hill Growers' Market")
    expect(page).to_not have_content("Cannot search city without state.")

    fill_in :city, with: "Albuquerque"
    fill_in :name, with: "Nob"
    click_button "Search for Markets"
    
    expect(current_path).to eq("/vendors/55823")

    expect(page).to_not have_content("Nob Hill Growers' Market")
    expect(page).to have_content("Cannot search city without state.")


  end
end