# controller to produce values to be displayed in the #navigate_autocomplete field in layouts/base.html.erb

class NavigatorsController < ApplicationController
#create instance variables to use in base.html.erb as the values in the new form #navigate_autocomplete dropdown
# assign the values to rows of a single column table with a class on it.. 

before_filter :login_required

	def recent_projects
    @recent_projects == Project.find(:all, :order => "updated_on DESC") 	
  end


end