require 'spec_helper'

describe "Authors" do
  describe "GET /authors" do
    it "works!" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get authors_path
      response.status.should be(200)
    end
  end
end
