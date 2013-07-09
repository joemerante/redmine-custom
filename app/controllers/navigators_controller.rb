# controller to produce values to be displayed in the #navigate_autocomplete field in layouts/base.html.erb

class NavigatorsController < ApplicationController

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
    if User.current.logged?
      results = []
      all_projects = Project.all
      all_projects.each do |project|
      	results.push(value: project_path(project.id), label: project.name)
      end
      render json: results
    else
      redirect_to 'root'
    end
  end

  # set up key bindings and make a keyboard command to jump into the #navigate_autocomplete search field


end