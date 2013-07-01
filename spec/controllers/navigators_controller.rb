require "spec_helper"

describe NavigatorsController do

  it "should generate a list of all projects by updated date descending" do
    controller.class.skip_before_filter :login_required
    all_projects.should == Project.find(:all, :order => "updated_on DESC")

    # response.should redirect_to("/clients/#{assigns(:client).id}")
  end

  it "should generate a list of projects sorted by those with the most recent issues" do
  	# pending - we want projects with recent issues, not based on project meta info
  end

  it "should redirect to the project page when you select a project" do
    # pending
    #controller.class.skip_before_filter :login_required
    # params[:id] = capybara.select(menu_item..)
    # response.should redirect_to("/projects/:id/activity")
  end

  # it "should pass params to new client" do
  #   post 'create', :client => {:first_name => "Joe", :last_name => "Mama", :email => "ha@ha.org"}
  #   assigns[:client].first_name.should == 'Joe'
  # end
end