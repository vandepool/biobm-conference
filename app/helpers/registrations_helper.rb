module RegistrationsHelper
    # Display Register or Sold Out Based on Tickets Available
    def register_link(event)
        if event.sold_out?
            content_tag(:button, "Event Full", class: "btn btn-lg btn-danger disabled")
        else
            link_to 'Join Event', new_event_registration_path(event), class: "btn btn-lg btn-success"
        end
    end
end
