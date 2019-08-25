# frozen_string_literal: true

class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show; end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save!
      @checklist = @project.checklist

      redirect_to new_checklist_questions_answer_path(@checklist.id),
                  flash: { notice: 'Project was successfully created.' }
    else
      redirect_to new_project_path,
                  flash: { error: @project.errors.full_messages.to_sentence }
    end
  end

  private

  def project_params
    params.require(:project).permit(:title, :checklist_id)
  end
end
