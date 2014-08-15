class ZenController < ApplicationController
  def index
    @zen = FirezenHandler::get_fire_zen
  end

  def from_new_zen
    FirezenHandler.send_fire_zen
    end
  end
end