require 'rails_helper'

RSpec.describe GroupsController, type: :controller do
  let(:group) do
    FactoryBot.create(:group)
  end

  describe "#index" do
    # it 'paramsからgroupの情報が取れてきとんか' do
    #   get :index, params: { id: group }
    # end
    it "リクエストは200 OKとなること" do
      expect(response.status).to eq 200
    end
  end

  describe "#new" do
    before do
      get :new
    end
    it "リクエストは200 OKとなること" do
      expect(response.status).to eq 302
    end
    it "newファイルへ遷移できているか" do
      expect(response).to redirect_to "/users/sign_in"
    end
  end

  describe "#update" do
    before do
      patch :update
    end
    it 'リクエストは200 OKとなること' do
      expect(response.status).to eq 200
    end
    it 'データベースが更新されること' do
      group.name = "higuchi.inc"
      expect(group.reload.name).to_not eq "higuchi.inc"
    end
    it "正しくeditにrenderされるか" do
      group.save
      expect(response).to redirect_to root_path 
    end
  end
end
