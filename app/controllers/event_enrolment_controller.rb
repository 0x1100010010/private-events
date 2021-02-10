class EventEnrolmentController < ApplicationController
  include EventEnrolmentHelper

  def create
    # set_event
    # @event_enrolment = EventEnrolment.new(event_enrolment_params)
    @event = Event.find(params[:event_id])
    @event_enrolment = EventEnrolment.new(event_id: @event.id, user_id: params[:user_id])
    if @event_enrolment.save
      flash[:notice] = 'Invitation sent!'
    else
      flash[:alert] = "Exception raised: #{@event_enrolment.errors}"
    end
    redirect_to request.referrer
  end

  def update
    # set_event
    @event = Event.find(params[:event_id])
    @event_enrolment = EventEnrolment.find_by(event_enrolment_params)
    if @event_enrolment
      flash[:notice] = "Verified for event '#{@event.name}'!"
    else
      flash[:alert] = 'Your name is not on the invitation list'
    end
    redirect_to request.referrer
  end

  def destroy
    # set_event
    @event = Event.find(params[:event_id])
    set_event_enrolment
    if current_user == @event.creator
      @event_enrolment.destroy
      flash[:notice] = 'Invitation is cancelled!'
    elsif @event_enrolment.save
      flash[:notice] = "You have dropped the enrollment for the #{event.name}!"
    else
      flash[:alert] = 'Failed to process request..!'
    end
    redirect_to request.referrer
  end
end
