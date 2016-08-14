class Admin::EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @events = Event.new
  end

  def create
    @events = Event.new(create_params)
    if @events.save
      @save_checker = true
    else
      @save_checker = false
    end
  end

  def show
    @events = Event.find(show_params[:id])
  end

  def edit
    @events = Event.find(edit_params[:id])
  end

  def update
    @events = Event.find(update_params[:id])
    if @events.update(events_params)
      @update_checker = true
    else
      @update_checker = false
    end
  end

  def destroy
    @events = Event.find(id_params[:id])
    DeletedEvent.create(event_id: id_params[:id])
    if @events.destroy
      @destroy_checker = true
    else
      @destroy_checker = false
    end
  end

  private
  def show_params
    params.permit(:id)
  end

  def edit_params
    params.permit(:id)
  end

  def update_params
    params.permit(:id)
  end

  def destroy_params
    params.permit(:id)
  end

  def event_params
    params.require(:event).permit(:title, :content, :place, :start_at, :end_at)
  end

end
