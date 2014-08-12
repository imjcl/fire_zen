class ZenController < ApplicationController
  def index
    @zen = FirezenHandler::get_fire_zen
  end

  def get_new_zen
    FirezenHandler.send_fire_zen
    redirect_to root_url
  end
end