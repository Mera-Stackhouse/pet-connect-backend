class Api::V1::EventsController < ApplicationController

  def show
    set_event
    render json: { event: EventSerializer.new(@event) }, status: :accepted
  end

  def create
    event = Event.new(event_params)
    params["event"]["users"].each{|u|
      EventsUser.new(event: event, user_id: u.id)
    }
    params["event"]["pets"].each{|p|
      EventsPet.new(event: event, pet_id: p.id)
    }
    debugger

    # @event = Event.create(event_params)
    #
    # params.event.users.each{|u|
    #   EventsUser.create(event: @event, user_id: u.id)
    # }
    # render json: @event, status: :accepted
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
    params.require(:event).permit(:location, :start_time, :event_type, :users, :pets)
  end

end
