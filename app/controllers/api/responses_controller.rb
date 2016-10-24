class Api::ResponsesController < Api::ApiController

  def index
    chorus = Chorus.find(params[:chorus_id])
    render json: chorus.responses
  end

  def show
    chorus = Chorus.find(params[:chorus_id])
    render json: chorus.responses.find(params[:id])
  end
end
