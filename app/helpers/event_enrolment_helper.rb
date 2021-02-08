module EventEnrolmentHelper
  include EventsHelper

  def event_enrolment_params
    params.require(:event).permit(:event_id, :user_id)
  end

  def set_event_enrolment
    @event_enrolment = EventEnrolment.find(params[:id])
  end

end
