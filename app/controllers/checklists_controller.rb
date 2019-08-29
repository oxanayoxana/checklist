class ChecklistsController < ApplicationController
  def new
    @checklist = Checklist.new(:form_id => params[:form_id])
  end

  def create
    @checklist = Checklist.build
    
    if @checklist.save!
      flash[:notice] = "checklist created!"
      respond_to do |format|
        format.html { render 'give_answers'}
        format.js {render 'give_answers'}
      end
    end
  end

  def build
    @checklist = Checklist.new(checklist_params)
    params[:form_id] = @checklist.form_id
    @form = Form.find(params[:form_id])
    @questions = @form.questions.all
    @answer = @checklist.answers.build
  end

  private
  def checklist_params
    params.require(:checklist).permit(:project, :form_id, :user_id, answers_attributes: %i[id status comment _destroy])
  end

  def current_checklist
    @checklist = Checklist.find(params[:id])
  end
end
