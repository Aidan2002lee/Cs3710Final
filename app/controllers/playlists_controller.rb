class PlaylistsController < ApplicationController
  before_action :get_account
  before_action :set_playlist, only: %i[ show edit update destroy ]

  # GET /playlists or /playlists.json
  def index
    @playlists = @account.playlists
  end

  # GET /playlists/1 or /playlists/1.json
  def show
  end

  # GET /playlists/new
  def new
    @playlist = @account.playlists.build
  end

  # GET /playlists/1/edit
  def edit
    @account = Account.find(params[:account_id])
    @playlist = @account.playlists.find(params[:id])
  end

  # POST /playlists or /playlists.json
  def create
    @playlist = @account.playlists.build(playlist_params)

    respond_to do |format|
      if @playlist.save
        format.html { redirect_to account_playlists_url(@account), notice: "Playlist was successfully created." }
        format.json { render :show, status: :created, location: @playlist }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @playlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /playlists/1 or /playlists/1.json
  def update
    respond_to do |format|
      if @playlist.update(playlist_params)
        format.html { redirect_to account_playlists_url(@account, @playlist), notice: "Playlist was successfully updated." }
        format.json { render :show, status: :ok, location: @playlist }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @playlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /playlists/1 or /playlists/1.json
  def destroy
    @playlist.destroy!

    respond_to do |format|
      format.html { redirect_to account_playlists_url(@account), notice: "Playlist was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def add_song
    playlist = current_account.playlists.find(params[:playlist_id])
    song = playlist.songs.create(track_params)
    if @song.save
      format.html { redirect_to playlists_url(@playlist), notice "Song successfully added." }
      format.json { render :show, :status, :created, location @song }
    else
      format.html { render: :new, status: :unprocessable_entity }
      format.json { render json: @song.errors, status: :unprocessable_entity }
    end
  end


  private

    # Use callbacks to share common path between accounts
    def get_account
      Rails.logger.debug "Params: #{params.inspect}"
      @account = Account.find(params[:account_id])
    end
    
    # Use callbacks to share common setup or constraints between actions.
    def set_playlist
      @playlist = @account.playlists.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def playlist_params
      params.require(:playlist).permit(:name, :capacity_of_songs, :description, :account_id)
    end

    def song_params
      params.require(:song).permit(:title, :artist, :release_date, :explicit, :spotify_id)
    end
end
