class ParksController < ApplicationController
  def index
    matching_parks = Park.all

    @list_of_parks = matching_parks.order({ :name => :asc })

    render({ :template => "parks/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_parks = Park.where({ :id => the_id })

    @the_park = matching_parks.at(0)

    render({ :template => "parks/show.html.erb" })
  end

  def create
    the_park = Park.new
    the_park.name = params.fetch("query_name")
    the_park.open_year_round = params.fetch("query_open_year_round", false)
    the_park.website = params.fetch("query_website")
    the_park.state_id = params.fetch("query_state_id")

    if the_park.valid?
      the_park.save
      redirect_to("/parks", { :notice => "Park created successfully." })
    else
      redirect_to("/parks", { :notice => "Park failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_park = Park.where({ :id => the_id }).at(0)

    the_park.name = params.fetch("query_name")
    the_park.open_year_round = params.fetch("query_open_year_round", false)
    the_park.website = params.fetch("query_website")
    the_park.state_id = params.fetch("query_state_id")

    if the_park.valid?
      the_park.save
      redirect_to("/parks/#{the_park.id}", { :notice => "Park updated successfully."} )
    else
      redirect_to("/parks/#{the_park.id}", { :alert => "Park failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_park = Park.where({ :id => the_id }).at(0)

    the_park.destroy

    redirect_to("/parks", { :notice => "Park deleted successfully."} )
  end
end
