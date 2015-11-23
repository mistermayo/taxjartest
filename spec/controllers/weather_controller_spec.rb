require 'rails_helper'
RSpec.describe WeatherController, type: :controller do
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all teams as @teams" do
      team = Team.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:teams)).to eq([team])
    end
  end
  it "renders the index template" do
     get :index
     expect(response).to render_template("index")
   end
 end
