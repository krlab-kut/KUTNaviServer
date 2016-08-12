class Admin::QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def new
    @answers = Answer.new(question_id: new_params[:id])
  end

  def edit
    @answers = Answer.find(edit_params[:id])
  end

  def create
    @answers = Answer.new(answer_params)
    if @answers.save
      @save_checker = true
    else
      @save_checker = false
    end
  end

  def show
    @questions = Question.find(show_params[:id])
    @answers = Answer.where("question_id = ?",show_params[:id])
  end

  def update
    @answers = Answer.find(show_params[:id])
    if @answers.update(answer_params)
      @update_checker = true
    else
      @update_checker = false
    end
  end

  def destroy
    @questions = Question.find(show_params[:id])
    DeletedQuestion.create(question_id: show_params[:id])
    @answers = Answer.where("question_id = ?", show_params[:id])
    @answers.each do |answer|
      DeletedAnswer.create(answer_id: answer.id)
    end
    if @questions.destroy
      @destroy_checker = true
    else
      @destroy_checker = false
    end
  end

  private

  def new_params
    params.permit(:id)
  end

  def edit_params
    params.permit(:id)
  end

  def show_params
    params.permit(:id)
  end

  def destroy_params
    params.permit(:id)
  end

  def answer_params
    params.require(:answer).permit(:content, :question_id)
  end

end
