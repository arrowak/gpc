class FormsController < ApplicationController

  def index
    @forms = Form.student_forms(current_user)
  end

  def new
    @form = Form.new
  end

  def create
    @form = Form.new(params[:form])
    @form.user = current_user

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
