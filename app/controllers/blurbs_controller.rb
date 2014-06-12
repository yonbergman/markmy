class BlurbsController < ApplicationController
  before_action :current_blurb, only: [:show, :destroy, :update, :update_background]

  before_filter :authenticate_user!, only: [:index, :update, :update_background]


  def index
    @title = I18n.translate('my_predictions')
    @blurbs = current_user.blurbs
  end

  def show
    impressionist(@blurb)
    @uploader = @blurb.custom_background
    @uploader.success_action_redirect = blurb_update_background_url(@blurb)
  end

  def create
    @blurb = create_blurb

    if @blurb.save
      redirect_to @blurb
    else
      render action: 'home'
    end
  end

  def update
    @blurb.update(edit_blurb_params)
    redirect_to @blurb
  end

  def update_background
    @blurb.update(key: params.require(:key))
    redirect_to @blurb
  end

  def destroy
    @blurb.destroy
    redirect_to blurbs_url
  end

  private
  def current_blurb
    @blurb ||= Blurb.find_by(token: params[:blurb_id].presence || params[:id])
    @title = @blurb.text
  end

  def blurb_params
    params.require(:blurb).permit(:text, :mood)
  end

  def edit_blurb_params
    params.require(:blurb).permit(:mood)
  end

  def create_blurb
    create_and_sign_in_guest_account unless user_signed_in?
    current_user.blurbs.build(blurb_params)
  end

end
