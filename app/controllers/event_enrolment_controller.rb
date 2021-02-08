class EventEnrolmentController < ApplicationController
  include EventEnrolmentHelper

  def create
    # set_event
    # @event_enrolment = EventEnrolment.new(event_enrolment_params)
    @event = Event.find(params[:event_id])
    @event_enrolment = EventEnrolment.new(event_id: @event.id, user_id: params[:user_id])
    if @event_enrolment.save
      flash[:notice] = "Invitation sent!"
      redirect_to request.referrer
    else
      flash[:alert] = 'Exception raised: #{@event_enrolment.errors}'
      redirect_to request.referrer
    end
  end

  def update
    # set_event
    @event = Event.find(params[:event_id])
    @event_enrolment = EventEnrolment.find_by(event_enrolment_params)
    if @event_enrolment
      flash[:notice] = "Verified for event '#{@event.name}'!"
      redirect_to request.referrer
    else
      flash[:alert] = 'Your name is not on the invitation list'
      redirect_to request.referrer
    end
  end

  def destroy
    # set_event
    @event = Event.find(params[:event_id])
    set_event_enrolment
    if current_user == @event.creator
      @event_enrolment.destroy
      flash[:notice] = "Invitation is cancelled!"
      redirect_to request.referrer
    else
      if @event_enrollment.save
        flash[:notice] = "You have dropped the enrollment for the #{event.name}!"
        redirect_to request.referrer
      else
        flash[:alert] = "Failed to process request..!"
        redirect_to request.referrer
      end
    end
  end
end
