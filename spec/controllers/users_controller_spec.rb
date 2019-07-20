require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe '#update' do
    before do
      @user = create(:user)
      @originalname = @user.name
    end
    it 'request 302' do
      expect(response.status).to eq 200
    end
    it 'update DB' do
      @user.reload
      expect(@user.name).to eq @originalname = @user.name
    end
    it 'redirect_to root_path' do
      expect(response).to redirect_to root_path
    end
  end
end
