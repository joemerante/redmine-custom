require "spec_helper"

describe NavigatorsController do
	integrate_views
  fixtures :projects

  it "should generate a list of all projects" do
    controller.class.skip_before_filter :login_required
    # only two project fixtures in there, so test passes
    NavigatorsController.new.all_projects.should == {projects(:projects_001).name => projects(:projects_001).id, projects(:projects_002).name => projects(:projects_002).id}
    # response.should redirect_to("/clients/#{assigns(:client).id}")
  end

  it "should show the list of all projects as an autocomplete dropdown in the #navigate_autocomplete field" do
  	# id #navigate_autocomplete.DOMchildren.should == @all_projects.keys
  	pending "figure out how to use capybara to test this"

	end


  it "should redirect to the project page when you select a project" do
    pending "first "
    # pass in the project id from the search result list to the url
    # response.should redirect_to("/projects/:id/activity")
  end

   it "should generate a list of projects sorted by those with the most recent issues" do
  	pending "eventually swap this for the first test - ideally want projects sorted by those with most recent issues, not based on when project meta info was last updated"
  end

  # it "should pass params to new client" do
  #   post 'create', :client => {:first_name => "Joe", :last_name => "Mama", :email => "ha@ha.org"}
  #   assigns[:client].first_name.should == 'Joe'
  # end
end