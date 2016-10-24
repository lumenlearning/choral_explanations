class Api::ChorusesController < Api::ApiController

  def index
    render json: Chorus.all
  end

  def show
    render json: Chorus.find(params[:id])
  end
end
