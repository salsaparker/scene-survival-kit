class PlaylistsController < ApplicationController
before_action :find_playlist, only: [:edit, :update, :show, :destroy]  
  
  def index
    @playlists = Playlist.all
  end

  def new
    @playlist = Playlist.new
  end

  def create
    @playlist = Playlist.create(playlist_params)
    if @playlist.save
      flash[:success]= "Playlist created!"
      redirect_to root_path #user_path(@playlist.user_id)
    else
      flash[:error]= "Playlist failed to create."
      render :new
    end
  end

  def edit
  end

  def update
    if @playlist.update(playlist_params)
      flash[:success]= "Playlist edited!"
      redirect_to profile_path(@playlist.profile_id)
    else
      flash[:error]= "Playlist failed to update"
      render :edit
    end
  end

  def show
  end

  def destroy
    @playlist.destroy  
    redirect_to playlists_path
  end

  private

    def find_playlist
      @playlist = Playlist.find_by(id: params[:id])  
    end

    def playlist_params
      params.require(:playlist).permit(:playlist_url, :profile_id, :user_id)
    end

end
