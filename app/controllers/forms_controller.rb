class FormsController < ApplicationController

  def new
    @form = Form.new
  end

  def create
    @form = Form.new(params[:form])

    if @form.save
      redirect_to form_path(@form)
    end
  end

  def show 
    @form = Form.find(params[:id])
  end

  def publish
    @form = Form.find(params[:form_id])
    @form.published = true
    @form.batch = Batch.find(params[:form][:batch_id])

    if(@form.save)
      redirect_to form_path(@form)
    end
  end
end
