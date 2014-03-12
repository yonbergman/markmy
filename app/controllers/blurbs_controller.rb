class BlurbsController < ApplicationController
  before_action :current_blurb, only: [:show, :destroy]

  def show
  end

  def new
    @blurb = Blurb.new
  end

  def create
    @blurb = Blurb.new(blurb_params)

    if @blurb.save
      redirect_to @blurb, notice: 'Blurb was successfully created.'
    else
      render action: 'new'
    end
  end

  def destroy
    @blurb.destroy
    redirect_to blurbs_url, notice: 'Blurb was successfully destroyed.'
  end

  private
  def current_blurb
    @blurb ||= Blurb.find_by(token: params[:id])
  end

  def blurb_params
    params.require(:blurb).permit(:text)
  end
end
