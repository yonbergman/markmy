class Admin::PredictionsController < Admin::BaseController
  def index
    @predictions = Blurb.all.reverse
  end
end
