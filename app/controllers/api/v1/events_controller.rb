class Api::V1::EventsController < ApplicationController

  def show
    set_event
    render json: { event: EventSerializer.new(@event) }, status: :accepted
  end

  def create
    event = Event.create(event_params)
    users = params[:event][:users]
    pets = params[:event][:pets]
    users.each{|u|
      EventsUser.create(event: event, user_id: u[:id])
    }
    pets.each{|p|
      EventsPet.create(event: event, pet_id: p[:id])
    }
    render json: event, status: :accepted
  end

  def update
    set_event
    @event.update(event_params)
    render json: @event, status: :accepted
  end

  def destroy
    set_event
    @event.destroy
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:location, :start_time, :event_type)
  end

end
