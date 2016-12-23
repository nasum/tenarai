require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  let(:user) { create(:user) }

  describe "POST /articles/preview" do
    it "get markdown" do
      login_user user
      post :preview, article: '## hogehoge'
      expect(response.status).to be(200)
      expect(response.body).to include "hogehoge"
    end
  end
end
