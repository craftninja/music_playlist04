class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new
    @song[:title] = params[:song][:title]
    @song[:url] = params[:song][:url]
    @song.save
    redirect_to songs_path
  end

end