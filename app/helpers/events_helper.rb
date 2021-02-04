module EventsHelper

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :description, :location, :start_time, :end_time, :date, :user_id)
  end
end
