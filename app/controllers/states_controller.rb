class StatesController < ApplicationController
  def index
    matching_states = State.all

    @list_of_states = matching_states.order({ :name => :asc })

    render({ :template => "states/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_states = State.where({ :id => the_id })

    @the_state = matching_states.at(0)

    render({ :template => "states/show.html.erb" })
  end

  def create
    the_state = State.new
    the_state.name = params.fetch("query_name")
    the_state.capital = params.fetch("query_capital")
    the_state.website = params.fetch("query_website")

    if the_state.valid?
      the_state.save
      redirect_to("/states", { :notice => "State created successfully." })
    else
      redirect_to("/states", { :notice => "State failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_state = State.where({ :id => the_id }).at(0)

    the_state.name = params.fetch("query_name")
    the_state.capital = params.fetch("query_capital")
    the_state.website = params.fetch("query_website")

    if the_state.valid?
      the_state.save
      redirect_to("/states/#{the_state.id}", { :notice => "State updated successfully."} )
    else
      redirect_to("/states/#{the_state.id}", { :alert => "State failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_state = State.where({ :id => the_id }).at(0)

    the_state.destroy

    redirect_to("/states", { :notice => "State deleted successfully."} )
  end
end
