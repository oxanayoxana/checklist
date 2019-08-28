class ChecklistsController < ApplicationController
  def new
    @checklist = Checklist.new
  end

  def create
    @checklist = Checklist.new(checklist_params)

    if @checklist.save!
      redirect_to root_path,
                  flash: { notice: 'Checklist was successfully created.' }
    else
      redirect_to :new,
                  flash: { error: @checklist.errors.full_messages.to_sentence }
    end
  end

  private

  def checklist_params
    params.require(:checklist).permit(:project, :form_id, :user_id, answers_attributes: %i[id status comment _destroy])
  end

  def current_checklist
    @checklist = Checklist.find(params[:id])
  end
end
