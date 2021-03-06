class RegistrationsController < ApplicationController
    # Only logged in users can view event registrations
    before_action :authenticate_user!
    
    # Get event id before registration actions
    before_action :set_event
    
    def index
        @registrations = @event.registrations
    end
    
    def new
        @registration = @event.registrations.new
    end
    
    def create
        @registration = @event.registrations.new(registration_params)
        if @registration.save
            redirect_to event_path(@event), notice: "You have successfully registered!"
        else
            render :new
        end
    end
    
    private
    
        def set_event
            @event = Event.find(params[:event_id])
        end
    
        def registration_params
            params.require(:registration).permit(:first_name, :last_name, :email, :location, :company, :position, :experience, :how_heard, :join_email_list)
        end
end
