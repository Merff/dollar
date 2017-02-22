class DollarsController < ApplicationController

  before_action :find_dollar_instance

  def show
  end

  def update
    if @dollar.update(dollar_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def edit
  end

  private

  def find_dollar_instance
    @dollar = Dollar.instance
  end

  def dollar_params
    params.require(:dollar).permit(:force_value, :force_time)
  end
end
