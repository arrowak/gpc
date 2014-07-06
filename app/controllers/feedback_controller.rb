class FeedbackController < ApplicationController

  def index
    @batch = Batch.find(params[:batch_id])
    @forms = Form.where(:batch_id => @batch, :published => true)
  end

  def show
    @batch = Batch.find(params[:batch_id])
    @form = Form.find(params[:id])
  end

  def submit
    render :json => params
  end

end
