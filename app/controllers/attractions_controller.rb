class AttractionsController < ApplicationController
  def index
    matching_attractions = Attraction.all

    @list_of_attractions = matching_attractions.order({ :created_at => :desc })

    render({ :template => "attractions/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_attractions = Attraction.where({ :id => the_id })

    matching_attractions1 = Attraction.all

    @list_of_attractions = matching_attractions1.order({ :created_at => :desc })

    @the_attraction = matching_attractions.at(0)

    render({ :template => "attractions/show.html.erb" })
  end

  def create
    the_attraction = Attraction.new
    the_attraction.park_id = params.fetch("query_park_id")
    the_attraction.activity_id = params.fetch("query_activity_id")
    the_attraction.name = params.fetch("query_name")

    if the_attraction.valid?
      the_attraction.save
      redirect_to("/attractions", { :notice => "Attraction created successfully." })
    else
      redirect_to("/attractions", { :notice => "Attraction failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_attraction = Attraction.where({ :id => the_id }).at(0)

    the_attraction.park_id = params.fetch("query_park_id")
    the_attraction.activity_id = params.fetch("query_activity_id")
    the_attraction.name = params.fetch("query_name")

    if the_attraction.valid?
      the_attraction.save
      redirect_to("/attractions/#{the_attraction.id}", { :notice => "Attraction updated successfully."} )
    else
      redirect_to("/attractions/#{the_attraction.id}", { :alert => "Attraction failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_attraction = Attraction.where({ :id => the_id }).at(0)

    the_attraction.destroy

    redirect_to("/attractions", { :notice => "Attraction deleted successfully."} )
  end
end
