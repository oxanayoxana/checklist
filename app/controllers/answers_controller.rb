class AnswersController < ApplicationController
  def index
    @answers = Answer.all
    @form = Form.find(params[:form_id])
    @questions = @form.questions.all
  end

  def new
    @answer = Answer.new
    @questions = @form.questions.all
  end

  def create
    @question = @form.questions.find(params[:question_id])
    @answer = @question.answers.build(answer_params)
    @answer.form = @form

    if @answer.save!
      redirect_to root_path,
                  flash: { notice: 'Answer was successfully created.' }
    else
      render :new,
                  flash: { error: @answer.errors.full_messages.to_sentence }
    end
  end

  private

  def answer_params
    params.require(:answer).permit!
    # (:status, :comment, :question_id, :form_id)
  end
end
