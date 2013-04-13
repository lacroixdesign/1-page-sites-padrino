require "spec_helper"

describe "Controller" do

  describe "GET #index" do
    it "renders the :index view" do
      get "/"
      last_response.should be_successful
    end
  end

end
