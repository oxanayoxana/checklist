class ChecklistsController < ApplicationController
  def index
    @checklists = Checklist.all
  end

  def new
    @checklist = Checklist.new
  end

  # def create
  #   @checklist = Checklist.new(checklist_params)

  #   if @checklist.save
  #     redirect_to checklists_path,
  #                 flash: { notice: 'Checklist was successfully created.' }
  #   else
  #     redirect_to new_checklist_path,
  #                 flash: { error: @checklist.errors.full_messages.to_sentence }
  #   end
  # end

  # private

  # def checklist_params
  #   params.require(:checklist).permit(:name, :description, :status, :project_id)
  # end
end
