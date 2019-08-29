class ChecklistsController < ApplicationController
  def new
    @checklist = Checklist.new
  end

  def create
    @checklist = Checklist.new(checklist_params)
    params[:form_id] = @checklist.form_id
    @form = Form.find(params[:form_id])
    # @checklist = @form.checklists.build(checklist_params)
    # @questions = @form.questions.all

    # @form.questions.all.each do |question|
    #   question.build_answer
    # end 
    # @checklist = @form.checklists.build

    # @answer = 
    # @questions.each do |question|
    #   question.answers.create!
    # end
    # @answer = @checklist.answers.build

    if @checklist.save!
      flash[:notice] = "checklist created!"
      respond_to do |format|
        format.html { redirect_to '/'}
        format.js { redirect_to '/'}
      end
    end
  end

  def build
    @checklist = Checklist.new(checklist_params)
    params[:form_id] = @checklist.form_id
    @form = Form.find(params[:form_id])
    @questions = @form.questions.all

    @answer = @checklist.answers.build

    # @question = 
    # @form.questions.all.each do |question|
    #   question.build_answer
    # end 
  end

  private
  def checklist_params
    params.require(:checklist).permit(:project, :form_id, :user_id, answers_attributes: %i[id status comment _destroy])
  end

  def current_checklist
    @checklist = Checklist.find(params[:id])
  end

  # def answers_params
  #   params.require(:answer).permit(:status, :comment)
  # end
end
