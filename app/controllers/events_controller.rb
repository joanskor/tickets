class EventsController < ApplicationController
  before_action :check_logged_in, :only => [:new, :create]

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
          if @event.save
            flash[:notice] = 'Dodawanie biletu zakończono sukcesem.'
            redirect_to "/events/#{@event.id}"
          else
            render 'new'
          end
  end

  private 

  def event_params
    params.require(:event).permit(:artist, :description, :price_low, :price_high, 
      :event_date, :ticket_amout, :age_limit)
  end

  def check_logged_in
    authenticate_or_request_with_http_basic("Ads") do |username, password|
      username == "admin" && password == "admin"
    end
  end
end
