class PlaylistsController < ApplicationController
  before_action :set_playlist, only: [:show, :edit, :update]
  def index
    @playlists = Playlist.all
  end

  def new
    @playlist = Playlist.new
    @songs    = Song.all
  end

  def create
    @playlist = Playlist.create(playlist_params)
    redirect_to @playlist
  end

  def show
  end

  def edit
    @songs = Song.all
  end

  def update
    @playlist.update(playlist_params)

    redirect_to playlists_path
  end

  private

  def playlist_params
    params.require(:playlist).permit(:name, song_ids: [])
  end

  def set_playlist
    @playlist = Playlist.find(params[:id])
  end
end
