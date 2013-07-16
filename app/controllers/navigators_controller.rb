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
    # jquery autocomplete puts the search query in params[:term]

    if User.current.logged?
      results = []
      all_projects = Project.all
      all_projects.each do |project|
      	if (project.name.include? params[:term]) || (project.name.downcase.include? params[:term]) 
          results.push(value: project_path(project.id), label: project.name)
        end
      end
      render json: results
    else
      redirect_to 'root'
    end
  end
end