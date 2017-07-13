require 'rails_helper'

RSpec.feature "User edits a playlist" do
  scenario "they visit the edit page" do
    song_one, song_two, song_three = create_list(:song, 3)
    playlist = create(:playlist)

    visit playlist_path(playlist)
    click_on "Edit"
    fill_in "playlist_name", with: "Rock On"
    check("song-#{song_two.id}")
    uncheck("song-#{song_one.id}")
    click_on "Update Playlist"

    expect(page).to have_content "Rock On"
    expect(page).to have_content song_two.id
    expect(page).to_not have_content song_one
  end
end
