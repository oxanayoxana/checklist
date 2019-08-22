# frozen_string_literal: true

class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  # def new
  #   @question = Question.new
  # end

  # def create
  #   @question = Question.new(question_params)

  #   if @question.save
  #     redirect_to questions_path,
  #                 flash: { notice: 'Question was successfully created.' }
  #   else
  #     redirect_to new_question_path,
  #                 flash: { error: @question.errors.full_messages.to_sentence }
  #   end
  # end

  # private

  # def question_params
  #   params.require(:question).permit(:title, :description)
  # end
end
