class Admin::EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def create
    @events = Event.new(events_params)
    if @events.save
      @save_checker = true
    else
      @save_checker = false
    end
  end

  def new
    @events = Event.new
  end

  def edit
    @events = Event.find(id_params[:id])
  end

  def show
    @events = Event.find(id_params[:id])
  end

  def update
    @events = Event.find(id_params[:id])
    if @events.update(events_params)
      @update_checker = true
    else
      @update_checker = false
    end
  end

  def destroy
    @events = Event.find(id_params[:id])
    if @events.destroy
      @destroy_checker = true
    else
      @destroy_checker = false
    end
  end

  private
  def id_params
    params.permit(:id)
  end
  def events_params
    params.require(:event).permit(:title, :content, :place, :start_at)
  end

end
