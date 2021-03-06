require 'rails_helper'

RSpec.describe Api::ChorusesController, type: :controller do
  let(:chorus) { FactoryGirl.create(:chorus) }
  let(:params) { {id: chorus.id} }


  context "is_public" do

    context "GET #index" do
      it "should return only default context for base route"

      it "should return choruses" do
        chorus
        get :index
        json = JSON.parse(response.body)

        expect(response).to have_http_status(:success)
        expect(json["data"].count).to eq 1
      end

    end

    context "GET #show" do
      it "should return the chorus" do
        chorus
        get :show, params: params
        json = JSON.parse(response.body)["data"]

        expect(response).to have_http_status(:success)
        expect(json["id"]).to eq chorus.id.to_s
        expect(json["type"]).to eq "choruses"
        expect(json["attributes"]["name"]).to eq chorus.name
        expect(json["relationships"]["context"]["data"]["id"]).to eq chorus.context.id
      end
    end
  end

  context "not public" do
    context "GET #index" do
      it "should not return if no token/session"
    end

    context "GET #show" do
      it "should not return if no token/session"
    end
  end


end
