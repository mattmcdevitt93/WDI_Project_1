class EventsController < ApplicationController
    before_action :authenticate_user!, except: [:home]
    before_action :set_event, only: [:show, :edit, :update, :destroy]


  def index
    @events = Event.all
  end

  def new
    @event = Event.new
    @user = current_user.email
  end

  def show
  end

  def edit
  end

  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
    end
  end

private

    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:event, :event_type, :location, :slots, :created_by, :event_date_start, :event_time_start, :event_date_finish, :event_time_finish)
    end

end
