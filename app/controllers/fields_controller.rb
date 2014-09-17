class FieldsController < ApplicationController

  def new
    @form = Form.find(params[:form_id])
    @field = Field.new
  end

  def create
    @form = Form.find(params[:form_id])
    @field = Field.new(params[:field])
    @field.form = @form

    if @field.save
      redirect_to form_path(@form)
    end
  end
end
