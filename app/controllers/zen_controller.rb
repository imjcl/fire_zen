class ZenController < ApplicationController
  def index
    @zen = FirezenHandler::get_fire_zen
  end

  def get_new_zen
    FirezenHandler.send_fire_zen
    respond_to do |format|
      format.html
    end
  end
end