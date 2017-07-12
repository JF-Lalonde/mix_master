require 'rails_helper'

RSpec.feature "User sees error without song title" do
  scenario "when they create song without title" do
    artist = create(:artist)

    visit artist_path(artist)
    click_on "New Song"
    click_on "Create Song"

    expect(page).to have_content "Title can't be blank"
  end
end
