class AnswersController < ApplicationController
  def index
    @answers = Answer.all
    @checklist = Checklist.find(params[:checklist_id])
    @questions = @checklist.questions.all
  end

  def new
    @answer = Answer.new
    @checklist = Checklist.find(params[:checklist_id])
    @questions = @checklist.questions.all
  end

  def create
    @checklist = Checklist.find(params[:checklist_id])
    # @questions = @checklist.questions.all
    @question = @checklist.questions.find(params[:question_id])
    # @answer = Answer.new(answer_params)
    @answer = @question.answers.build(answer_params)
    @answer.checklist = @checklist

    if @answer.save!
      redirect_to checklist_questions_answers_path,
                  flash: { notice: 'Answer was successfully created.' }
    else
      render :new,
                  flash: { error: @answer.errors.full_messages.to_sentence }
    end
  end

  private

  def answer_params
    params.require(:answer).permit!
    # (:status, :comment, :question_id, :checklist_id)
  end
end
