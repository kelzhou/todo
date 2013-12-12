class EventsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @events = Event.all.sort_by! { |m| m.date }
    @events_meetings = Event.meeting.sort_by! { |m| m.date }
    @events_dates = Event.date.sort_by! { |m| m.date }
    @events_others = Event.others.sort_by! { |m| m.date }
  end

  def new
  	@event = Event.new
  end

  def create
    @event = Event.new(params[:event])
    if @event.save
      client = Postmark::ApiClient.new('2cb38ae3-d143-4150-9dca-cbe8939c1858')
      client.deliver(from: 'zhouwe@seas.upenn.edu',
               to: current_user.email,
               subject: 'New Event Creatation',
               html_body: "Hi #{current_user.email},<br><br>You just created a new event!
                          <p>Check it out on the app!<br><br>
                          Thanks, The Personal Planner App (http://kellysplanner.herokuapp.com/)")

		  redirect_to events_path
    else
		  render 'new'
    end
  end

  def edit 
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(params[:event])
      redirect_to events_path
    else
      render 'edit'
    end
  end

  def destroy
    @event = Event.find(params[:id])
    client = Postmark::ApiClient.new('2cb38ae3-d143-4150-9dca-cbe8939c1858')
    client.deliver(from: 'zhouwe@seas.upenn.edu',
               to: current_user.email,
               subject: 'Deleted Event',
               html_body: "Hi #{current_user.email},<br><br>You just deleted an event.
                          <p>Check it out on the app!<br><br>
                          Thanks, The Personal Planner App (http://kellysplanner.herokuapp.com/)")

    @event.destroy
    redirect_to events_path
  end

  def show
    @event = Event.find(params[:id])
  end

end
