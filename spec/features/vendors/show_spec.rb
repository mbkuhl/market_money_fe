require "rails_helper"

RSpec.describe "Vendors Show" do

  it 'will have a "more info" button next to each market that takes me to the market show page' do
    visit "/vendors/55823"
save_and_open_page
    expect(page).to have_content("The Charcuterie Corner")
    expect(page).to have_content("Contact Info:")
    expect(page).to have_content("name: Claudie Langworth III")
    expect(page).to have_content("phone: 1-147-179-9747")
    expect(page).to have_content("Credit Accepted?: NO")
    expect(page).to have_content("Description: Vendor selling a variety of artisanal cured meats and sausages.")
    
    visit "/vendors/55149"
    save_and_open_page
    expect(page).to have_content("Leafy Greens")
    expect(page).to have_content("Contact Info:")
    expect(page).to have_content("name: Tari Ledner")
    expect(page).to have_content("phone: 1-129-873-5578")
    expect(page).to have_content("Credit Accepted?: YES")
    expect(page).to have_content("Description: sells a variety of leafy greens and salad mixes")
    
  end
end