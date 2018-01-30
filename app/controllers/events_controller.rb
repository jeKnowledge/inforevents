class EventsController < ApplicationController

  before_action :set_event, only: [:edit, :update, :show, :destroy]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:success] = "You created an event successfully"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @event.update(event_params)
      flash[:success] = "Event was successfully updated"
      redirect_to event_path(@event)
    else
      render 'edit'
    end
  end

  def show
  end

  def delete
    @event.destroy
    flash[:danger] = "Event was successfully deleted"
    redirect_to events_path
  end

  def index
    @events = Event.all
  end

  private

  def event_params
    params.require(:event).permit(:title, :description)
  end

  def set_user
    @event = Event.find(params[:id])
  end

  def require_same_user
    if current_user != @event.user && !current_user.admin?
      flash[:danger] = "You can only edit or delete your own events"
      redirect_to root_path
    end
  end

end
