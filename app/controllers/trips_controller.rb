class TripsController < ApplicationController
  before_action(:must_be_signed_in)

  def must_be_signed_in
    if @current_user == nil
      redirect_to("/user_sign_in", {:alert => "Please sign in first."})
    end
  end

  def index
    matching_trips = @current_user.trips

    @upcoming_trips = matching_trips.where("departs_at > ?", Time.now).order({ :created_at => :desc })

    @past_trips = matching_trips.where("departs_at <= ?", Time.now).order({ :created_at => :desc })

    render({ :template => "trips/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_trips = Trip.where({ :id => the_id })

    @the_trip = matching_trips.at(0)

    render({ :template => "trips/show.html.erb" })
  end

  def create
    the_trip = Trip.new
    the_trip.user_id = @current_user.id
    the_trip.departs_at = params.fetch("query_departs_at")
    the_trip.park_id = params.fetch("query_park_id")

    if the_trip.valid?
      the_trip.save
      redirect_to("/trips", { :notice => "Trip created successfully." })
    else
      redirect_to("/trips", { :notice => "Trip failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_trip = Trip.where({ :id => the_id }).at(0)

    the_trip.user_id = params.fetch("query_user_id")
    the_trip.park_id = params.fetch("query_park_id")

    if the_trip.valid?
      the_trip.save
      redirect_to("/trips/#{the_trip.id}", { :notice => "Trip updated successfully."} )
    else
      redirect_to("/trips/#{the_trip.id}", { :alert => "Trip failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_trip = Trip.where({ :id => the_id }).at(0)

    the_trip.destroy

    redirect_to("/trips", { :notice => "Trip deleted successfully."} )
  end
end
