class Admin::QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def new
    @answers = Answer.new(question_id: id_params[:id])
  end

  def edit
    @answers = Answer.find(id_params[:id])
  end

  def create
    @answers = Answer.new(answers_params)
    if @answers.save
      @save_checker = true
    else
      @save_checker = false
    end
  end

  def show
    @questions = Question.find(id_params[:id])
    @answers = Answer.where("question_id = ?",id_params[:id])
  end

  def update
    @answers = Answer.find(id_params[:id])
    if @answers.update(answers_params)
      @update_checker = true
    else
      @update_checker = false
    end
  end

  def destroy
    @questions = Question.find(id_params[:id])
    DeletedQuestion.create(question_id: id_params[:id])
    @answers = Answer.where("question_id = ?", id_params[:id])
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

  def id_params
    params.permit(:id)
  end

  def answers_params
    params.require(:answer).permit(:content, :question_id)
  end
  
end
