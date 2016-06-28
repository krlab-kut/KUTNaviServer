class Admin::AnswersController < ApplicationController
  def destroy
    @answers = Answer.find(id_params[:id])
    @answers.destroy
    redirect_to :back
  end
  private
  def id_params
    params.permit(:id)
  end
end
