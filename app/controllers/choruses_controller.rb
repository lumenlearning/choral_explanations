class ChorusesController < Api::ApiController

  def index
  end

  def show
  end

  # used for LTI launch into edit
  def create
    render :new
  end
end
