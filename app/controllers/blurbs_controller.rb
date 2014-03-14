class BlurbsController < ApplicationController
  before_action :current_blurb, only: [:show, :destroy]

  before_filter :authenticate_user!, only: [:index]

  def index
    @title = 'My Blurbs'
    @blurbs = current_user.blurbs
  end

  def show
  end

  def new
    @blurb = Blurb.new
  end

  def create
    @blurb = create_blurb

    if @blurb.save
      redirect_to @blurb
    else
      render action: 'new'
    end
  end

  def destroy
    @blurb.destroy
    redirect_to blurbs_url
  end

  private
  def current_blurb
    @blurb ||= Blurb.find_by(token: params[:id])
    @title = @blurb.text
  end

  def blurb_params
    params.require(:blurb).permit(:text)
  end

  def create_blurb
    create_and_sign_in_guest_account unless user_signed_in?
    current_user.blurbs.build(blurb_params)
  end
end
