require 'spec_helper'


describe "Service" do
  let(:user_id) { 'f1' }
  let(:name) { '测试' }
  let(:portrait_uri) { '' }

  describe "#user_get_token" do

    it "should get token success" do
      params = { user_id: user_id, name: name, portrait_uri: portrait_uri }
      result = RongCloudIM::Service.user_get_token(params)

      expect(result["code"]).to eq(200)
      expect(result["userId"]).to eq('f1')
    end

  end

  
end