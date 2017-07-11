require 'rails_helper'

RSpec.feature "User submits a new artist" do
  scenario "they enter data to create a new artist" do
    artist_name = "Jimi Hendrix"
    artist_image_path = "https://static1.squarespace.com/static/5548d843e4b0f2df4caa3a5b/t/5747162062cd94c83383c874/1464276518097/"

    visit '/artists'
    click_on "New artist"
    fill_in "artist_name", with: artist_name
    fill_in "artist_image_path", with: artist_image_path
    click_on "Create Artist"

    expect(page).to have_content artist_name
    expect(page).to have_css("img[src=\"#{artist_image_path}\"]")
  end

  context "the submitted data is invalid" do
    scenario "they see an error message" do
      artist_image_path = "https://static1.squarespace.com/static/5548d843e4b0f2df4caa3a5b/t/5747162062cd94c83383c874/1464276518097/"

      visit artists_path
      click_on "New artist"
      fill_in "artist_image_path", with: artist_image_path
      click_on "Create Artist"

      expect(page).to have_content "Name can't be blank"
    end
  end
end
