require 'spec_helper'


describe "RongCloudIM::Group" do
  let(:user_id) { 'f1' }
  let(:user_id2) { 'f2' }
  let(:group_id) { 'g1' }
  let(:group_name) { '群' }
  let(:name) { '测试' }
  let(:portrait_uri) { '' }

  describe "#create" do

    it "should create success" do
      params = { user_id: user_id, group_id: group_id, group_name: group_name }
      result = RongCloudIM::Group.create(params)

      expect(result["code"]).to eq(200)
    end

    it "should create args error" do
      params = { group_id: group_id, group_name: group_name }
      result = RongCloudIM::Group.create(params)

      expect(result["code"]).to eq(1002)
    end

    it "should create args error" do
      params = { group_name: group_name }
      result = RongCloudIM::Group.create(params)

      expect(result["code"]).to eq(1002)
    end

  end



  
end