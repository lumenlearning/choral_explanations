require 'rails_helper'

RSpec.describe Api::ResponsesController, type: :controller do
  let(:c_response) { FactoryGirl.create(:response) }
  let(:params) { {chorus_id: c_response.chorus.id} }

  context "is_public" do

    context "GET #index" do
      it "should return choruses" do
        c_response
        get :index, params: params
        json = JSON.parse(response.body)

        expect(response).to have_http_status(:success)
        expect(json["data"].count).to eq 1
      end

    end

    context "GET #show" do
      it "should return the chorus" do
        c_response
        get :show, params: params.merge(id: c_response.id)
        json = JSON.parse(response.body)["data"]

        expect(response).to have_http_status(:success)
        expect(json["id"]).to eq c_response.id.to_s
        expect(json["type"]).to eq "responses"
        expect(json["attributes"]["name"]).to eq c_response.name
        expect(json["attributes"]["license"]).to eq c_response.license
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
