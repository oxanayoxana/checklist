class AnswersController < ApplicationController
  def index
    @answers = Answer.all
    @checklist = Checklist.find(params[:id])
    @questions = @checklist.questions
  end

  def new
    @answer = Answer.new
  end

  def create
    @answer = Answer.new(answer_params)

    if @answer.save
      redirect_to answers_path,
                  flash: { notice: 'Answer was successfully created.' }
    else
      redirect_to new_answer_path,
                  flash: { error: @answer.errors.full_messages.to_sentence }
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:status, :comment, :question_id)
  end
end
