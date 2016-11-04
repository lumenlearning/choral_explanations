class Api::ResponsesController < Api::ApiController

  def index
    chorus = Chorus.find(params[:chorus_id])
    render json: chorus.responses.includes(:user)
  end

  def show
    chorus = Chorus.find(params[:chorus_id])
    render json: chorus.responses.find(params[:id])
  end

  def create
    chorus = Chorus.find(params[:chorus_id])
    res = chorus.responses.new
    res.context = chorus.context
    res.name = params[:response][:name]
    #todo sanitize and whitelist
    res.description = params[:response][:description]
    res.license = params[:response][:license]
    res.save!

    render json: res
  end
end
