class FeedbackController < ApplicationController

  def index
    @batch = Batch.find(params[:batch_id])
    @forms = Form.where(:batch_id => @batch, :published => true)
  end

  def show
    @batch = Batch.find(params[:batch_id])
    @form = Form.find(params[:id])

    if(@form.submitted?(current_user))
      redirect_to batch_feedback_answers_path(@batch, @form)
    end
  end

  def create
    feedbacks = []
    @batch = Batch.find(params[:batch_id])
    params.each do |param|
      match = /field_([\d]+)$/.match(param[0])
      if(match)
        field = Field.find(match[1])
        feedback = Feedback.new
        feedback.user = current_user
        feedback.field = field
        feedback.answer = ( field.category === Field::CHECKBOX_FIELD ) ? params["field_#{field.id}"].join(",") : params["field_#{field.id}"]

        # TODO: Check for validation

        feedbacks << feedback
      end
    end

    # TODO: Add multiple insertion, the below method is sucky!
    feedbacks.each do |feedback|
      feedback.save
    end

    redirect_to batch_feedback_index_path(@batch)
  end

  def answers
    @batch = Batch.find([params[:batch_id]])
    @form = Form.find(params[:feedback_id])
    @fields = @form.fields
    @answers = Feedback.includes(:field).where(:field_id => @fields, :user_id => current_user)
  end

end
