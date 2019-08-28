class ChecklistsController < ApplicationController
  def new
    @checklist = Checklist.new
    @form = Form.find(params[:form_id])
    @questions = @form.questions.all
    @answer = Answer.new
  end
end
