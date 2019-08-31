# frozen_string_literal: true

class WelcomeController < ApplicationController
  def index
    @checklists = Checklist.all
    @forms = Form.all
    @questions  = Question.all
  end
end
