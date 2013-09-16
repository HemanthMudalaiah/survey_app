require 'spec_helper'

describe SurveysController do

  # before(:each) do
  #   Survey.delete_all
  # end

  # after(:all) do
  #   Survey.remove_all_from_index!
  # end

  describe "Surveys Controller specs" do
    login_user
    it "renders index page" do
      get :index
      expect(response).to render_template("index")
    end

    it "shows survey" do
      survey = FactoryGirl.create(:survey)
      get :show, :id => survey.id
      response.should be_success
    end

    # context "create" do
    #   let(:params) { FactoryGirl.attributes_for(:survey)}

    #   it "should create survey" do
    #     survey = FactoryGirl.create(:survey)
    #     post :create, :survey =>params
    #     response_should be_redirect
    #     flash[:notice].should == "Successfully created survey."
    #   end
    # end
  end

end
