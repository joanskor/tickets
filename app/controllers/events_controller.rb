class EventsController < ApplicationController
  before_action :set_event, only: [:show]

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
    
        respond_to do |format|
          if @event.save
            format.html { redirect_to @event, notice: 'Event was successfully created.' }
            format.json { render :show, status: :created, location: @event }
          else
            format.html { render :new }
            format.json { render json: @event.errors, status: :unprocessable_entity }
          end
        end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @ticket = Event.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def event_params
    params.require(:event).permit(:artist, :description, :price_low, :price_high, :event_date)
  end
end
