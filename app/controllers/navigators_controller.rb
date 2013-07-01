# controller to produce values to be displayed in the #navigate_autocomplete field in layouts/base.html.erb

class NavigatorsController < ApplicationController

#	before_filter :login_required

	def all_projects
    @all_projects = {}
    Project.find(:all).each do |project|
    	@all_projects[project.name] = project.id
    end
	 	@all_projects
  end

  def search_projects
    # jquery autocomplete puts the search in params[:term] - so search_projects?term=
    # if params[:term]
    #   like = "%".concat(params[:term].concat("%"))
    #   users = Project.where("name like ?", like)
    # else
    #   users = Project.all
    # end

    # This shows a list of all possible results for any user input - need to make it an actual search, but good enough for now since there are only ten possible results
    results = []
    all_projects = Project.all
    all_projects.each do |project|
    	results.push(project.name)
    end
		render json: results
  end

  # include the project id's in the json results, figure out how to render autocomplete results as links to 'projects/:id/activity'
  # set up key bindings and make a keyboard command to jump into the #navigate_autocomplete search field


end