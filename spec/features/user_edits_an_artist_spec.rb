require 'rails_helper'

RSpec.feature "User edits an existing artist" do
  scenario "they enter data to update an artist" do
    artist = Artist.create(name: "Peter Frampton", image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")

    visit artist_path(artist)
    click_on "Edit"
    fill_in "artist_name", with: "Capybarock"
    click_on "Update Artist"

    expect(page).to have_content "Capybarock"
    expect(page).to have_css("img[src=\"#{"http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"}\"]")
  end
end
