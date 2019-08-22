# frozen_string_literal: true

class WelcomeController < ApplicationController
  def index
    @projects   = Project.all
    @checklists = Checklist.all
    @questions  = Question.all
  end
end
