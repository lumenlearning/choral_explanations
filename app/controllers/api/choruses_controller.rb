class Api::ChorusesController < Api::ApiController

  ALLOWED_INCLUDES = %w{responses user responses.user}

  def index
    render json: Chorus.all.includes(:user)
  end

  def show
    requested_include = params[:include] ? params[:include].split(",") : []
    include = requested_include & ALLOWED_INCLUDES

    render json: Chorus.find(params[:id]), include: include
  end
end
