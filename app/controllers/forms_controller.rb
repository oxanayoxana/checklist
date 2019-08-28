# frozen_string_literal: true

class FormsController < ApplicationController
  before_action :current_form, only: %i[show edit update destroy]

  def index
    @forms = Form.all
  end

  def new
    @form = Form.new
    @form.questions.build
  end

  def show; end

  def create
    @form = Form.new(form_params)

    if @form.save!
      redirect_to forms_path,
                  flash: { notice: 'Form was successfully created.' }
    else
      redirect_to new_form_path,
                  flash: { error: @form.errors.full_messages.to_sentence }
    end
  end

  private

  def form_params
    params.require(:form).permit(:name, :description, :status, questions_attributes: %i[id title description _destroy])
  end

  def current_form
    @form = Form.find(params[:id])
  end
end
