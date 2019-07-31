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

    EventsUser.where(event_id: @event.id).delete_all
    EventsPet.where(event_id: @event.id).delete_all

    users = params[:event][:users]
    pets = params[:event][:pets]
    users.each{|u|
      EventsUser.create(event: @event, user_id: u[:id])
    }
    pets.each{|p|
      EventsPet.create(event: @event, pet_id: p[:id])
    }
    render json: @event, status: :accepted
  end

  def destroy
    set_event
    @event.destroy
    render json: {}, status: :no_content
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:location, :start_time, :event_type)
  end

end
