class ZenController < ApplicationController
  def index
    @zen = FirezenHandler::get_fire_zen
  end

  def from_new_zen
    @is_duplicate = FirezenHandler.send_fire_zen
  end

  def submit_zen
    @is_duplicate = FirezenHandler.submit_fire_zen params[:submit_zen]
  end
end