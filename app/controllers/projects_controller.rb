# frozen_string_literal: true

class ProjectsController < ApplicationController
  def index
    @projects = Project.all
    # @checklists = Checklist.all
  end

  def show; end

  def new
    @project = Project.new
    # @checklists = Checklist.all
    @checklist = Checklist.find(params[:id])
  end

  def create
    @project = Project.new(project_params)
    # @checklist = Checklist.find(params[:id])
    # @checklist = Checklist.find(params[:checklist_id])
    # @questions = @checklist.questions.all
    # @project = @checklist.projects.build(project_params)
    @checklist = @project.checklist

    if @project.save!
      # project = Project.find(params[:id])
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
