require 'rails_helper'

RSpec.feature "User deletes an existing artist" do
  scenario "they visit the show page and delete the artist" do
    artist = Artist.create(name: "Jimi Hendrix", image_path: "https://static1.squarespace.com/static/5548d843e4b0f2df4caa3a5b/t/5747162062cd94c83383c874/1464276518097/")

    visit artist_path(artist)
    click_on "Delete"

    expect(page).to_not have_content "Jimi Hendrix"
  end
end
